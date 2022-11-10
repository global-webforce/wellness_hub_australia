import 'dart:math';

import 'package:ez_core/ez_core.dart';
import 'package:wellness_hub_australia/features/tasks/widgets/empty_tasks.dart';
import 'package:wellness_hub_australia/features/tasks/widgets/task_card.dart';
import 'package:wellness_hub_australia/features/tasks/viewmodels/tasks_viewmodel.dart';
import 'package:wellness_hub_australia/app/shared/ui/list_gridview_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        final tasks = viewModel.tasks;
        return Scaffold(
            appBar: AppBar(
              title: Text("My ${viewModel.pillar!.title} Tasks"),
            ),
            body: ListGridViewWrapper(
              isBusy: viewModel.isBusy,
              emptyIndicatorWidget: const EmptyTasks(),
              onRefresh: () async {
                await viewModel.getAll();
              },
              itemCount: tasks.length,
              builder: (context, constraints) {
                return AlignedGridView.count(
                  padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: max((screenWidth(context) - 1000) / 2, 15)),
                  crossAxisCount: isMobile(context) ? 1 : 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: tasks[index],
                      onTap: () {
                        viewModel.goToTaskDetailPage(tasks[index].id);
                      },
                      onTapAlarm: () {
                        viewModel.goToTaskAlarmPage(tasks[index].id);
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
