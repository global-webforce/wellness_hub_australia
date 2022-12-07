import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/tasks/viewmodels/tasks_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:stacked/stacked.dart';

class TaskDetailPage extends StatelessWidget {
  final int? taskId;
  const TaskDetailPage({Key? key, this.taskId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TasksViewModel>.nonReactive(
        viewModelBuilder: () => TasksViewModel(),
        onModelReady: (viewModel) async {
          viewModel.taskId = taskId;
          viewModel.pillarId = viewModel.task!.pillarId;
        },
        builder: (context, viewModel, child) {
          final task = viewModel.task;

          return Scaffold(
              appBar: AppBar(
                leading: const AutoLeadingButton(),
                actions: const [hSpaceSmall],
              ),
              bottomNavigationBar: const FinishTaskButton(),
              body: (task == null || task.embedUrl == null)
                  ? const Center()
                  : LayoutBuilder(builder: (context, constraints) {
                      return Container(
                          color: Colors.white, child: const _TaskWebView());
                    }));
        });
  }
}

class FinishTaskButton extends ViewModelWidget<TasksViewModel> {
  const FinishTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, TasksViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).backgroundColor,
      child: SizedBox(
          height: 40,
          child: viewModel.task?.taskProgressId != null && !viewModel.isBusy
              ? Tooltip(
                  message: '(Press-hold to Undo)',
                  child: EzButton.elevated(
                    busy: viewModel.isBusy,
                    leading: Icons.check_circle_rounded,
                    title: "Task Completed ",
                    onLongPress: () async {
                      await viewModel.toggleProgress(viewModel.task!.id);
                    },
                    rounded: true,
                    background: Colors.green,
                  ),
                )
              : Tooltip(
                  message: "Tap to set as Finished",
                  child: EzButton.elevated(
                    busy: viewModel.isBusy,
                    leading: Icons.add,
                    title: "Set as Finished",
                    onTap: () async {
                      await viewModel.toggleProgress(viewModel.task!.id);
                    },
                    background: Colors.grey,
                    rounded: true,
                  ),
                )),
    );
  }
}

class _TaskWebView extends ViewModelWidget<TasksViewModel> {
  @override
  bool get reactive => false;

  const _TaskWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, TasksViewModel viewModel) {
    final task = viewModel.task;

    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: SizedBox(
          width: 1000,
          height: constraints.maxHeight,
          child: HtmlWidget(
            """
                                  <iframe src="${task!.embedUrl}" 
                                  height="auto" 
                                  width="100%">
                                  </iframe>
                                  """,
            factoryBuilder: () => MyWidgetFactory(),
            onLoadingBuilder: (context, element, loadingProgress) =>
                const Center(
              child: CircularProgressIndicator(),
            ),
            onErrorBuilder: (context, element, error) => Text(error),
            renderMode: RenderMode.column,
            isSelectable: false,
            buildAsync: true,
            rebuildTriggers: RebuildTriggers([task.embedUrl]),
            key: UniqueKey(),
            enableCaching: false,
          ),
        ),
      );
    });
  }
}

class MyWidgetFactory extends WidgetFactory {
  @override
  bool get webViewMediaPlaybackAlwaysAllow => true;
  @override
  bool get webView => true;
}
