import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/app/shared/ui/sliver_grid_delegate.dart';
import 'package:wellness_hub_australia/features/tasks/widgets/task_card.dart';
import 'package:wellness_hub_australia/features/tasks/viewmodels/tasks_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_and_grid_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TasksPage extends StatelessWidget {
  final int? pillarId;
  const TasksPage({Key? key, this.pillarId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TasksViewModel>.reactive(
      viewModelBuilder: () => TasksViewModel(),
      onModelReady: (viewModel) async {
        viewModel.pillarId = pillarId;
        await viewModel.getAll();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("My ${viewModel.pillar!.title} Tasks"),
            ),
            body: ListAndGridViewWrapper(
              isBusy: viewModel.isBusy,
              emptyIndicatorWidget: const EmptyDisplay(
                icon: Icons.light_mode_rounded,
                title: "No Tasks",
              ),
              onRefresh: () async {
                await viewModel.getAll();
              },
              itemCount: viewModel.tasks.length,
              builder: (context, constraints) {
                return GridView.builder(
                  itemCount: viewModel.tasks.length,
                  padding: Dimens.sliverPadding(constraints),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: isMobile(context) ? 1 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    height: 115,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCard(
                      task: viewModel.tasks[index],
                      onTap: () {
                        viewModel.goToTaskDetailPage(viewModel.tasks[index].id);
                      },
                      onTapAlarm: () {
                        viewModel.goToTaskAlarmPage(viewModel.tasks[index].id);
                      },
                    );
                  },
                );
              },
            ));
      },
    );
  }
}
