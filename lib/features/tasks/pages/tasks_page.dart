import 'package:ez_dashboard/screen_size_helper.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellness_hub_australia/app/shared/constants/dimensions.dart';
import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:wellness_hub_australia/features/task_alarm/pages/add_task_alarm_page.dart';
import 'package:wellness_hub_australia/features/tasks/pages/task_detail_page.dart';
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
              backgroundColor: HexColor("${viewModel.pillar?.colorTheme}"),
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
                return AlignedGridView.count(
                  crossAxisCount: isMobile(context) ? 1 : 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: viewModel.tasks.length,
                  padding: Dimens.sliverPadding(constraints),
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: viewModel.tasks[index],
                      color: HexColor("${viewModel.pillar?.colorTheme}"),
                      onTap: () {
                        viewModel.navigationService
                            .navigateToView(TaskDetailPage(
                          taskId: viewModel.tasks[index].id,
                          color: HexColor("${viewModel.pillar?.colorTheme}"),
                        ));
                      },
                      onTapAlarm: () {
                        viewModel.navigationService.navigateToView(
                          AddTaskAlarmPage(
                              taskId: viewModel.tasks[index].id,
                              color:
                                  HexColor("${viewModel.pillar?.colorTheme}")),
                        );
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
