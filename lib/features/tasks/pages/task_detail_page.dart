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
  @override
  bool get reactive => true;

  const FinishTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, TasksViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).backgroundColor,
      child: SizedBox(
          height: 40,
          child: viewModel.task?.taskProgressId != null
              ? Tooltip(
                  message: '(Press-hold to Undo)',
                  child: EzButton.elevated(
                    busy: viewModel.isBusy,
                    leading: Icons.check_circle_rounded,
                    title: "Task Completed ",
                    onLongPress: () {
                      viewModel.toggleProgress(viewModel.task!.id);
                    },
                    rounded: true,
                  ),
                )
              : Tooltip(
                  message: "Tap to set as Finished",
                  child: EzButton.elevated(
                    busy: viewModel.isBusy,
                    leading: Icons.add,
                    title: "Set as Finished",
                    onTap: () {
                      viewModel.toggleProgress(viewModel.task!.id);
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

/* class EmptyTask extends StatelessWidget {
  const EmptyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Widget fallBackIcon = Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              "/images/placeholder.png",
              fit: BoxFit.cover,
              width: 120,
              height: 120,
            ),
          );

          Widget _image() {
            return Card(
                elevation: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://gwf-cors-anywhere.herokuapp.com/${task!.imgUrl}",
                  //color: Colors.white,
                  width: 120,
                  height: 120,
                  placeholder: (context, v) {
                    return fallBackIcon;
                  },
                  errorWidget: (context, url, error) {
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: fallBackIcon,
                    );
                  },
                ));
          }

          Widget _frequency() {
            Color? color;
            String? text;
            switch (task!.frequency) {
              case "daily":
                color = Colors.blue;
                text = "Today";
                break;
              case "weekly":
                color = Colors.green;
                text = "This Week";
                break;
              case "monthly":
                color = Colors.orange;
                text = "This Month";
                break;
              case "once":
                color = Colors.red;
                text = "Try it!";
                break;
              default:
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color!.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  text!.toTitleCase(),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            );
          }

          Widget _title() {
            return Text(
              "${task!.title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            );
          }

          Widget _description() {
            return Text(
              "${task!.description}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                height: 1.3,
              ),
            );
          }

        
            return SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _frequency(),
                    vSpaceSmall,
                    _image(),
                    vSpaceRegular,
                    _title(),
                    vSpaceRegular,
                    _description(),
                  ],
                ),
              ),
            );
          
  }
} */
