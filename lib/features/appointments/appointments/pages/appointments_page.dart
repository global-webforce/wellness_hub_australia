// ignore: implementation_imports
import 'dart:math';
import 'package:ez_core/ez_core.dart';
import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/viewmodels/appointments_viewmodel.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/widgets/sf_calendar_widget.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/book_appointment_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentViewModel>.reactive(
        viewModelBuilder: () => AppointmentViewModel(),
        onModelReady: (viewModel) => viewModel.getAll(),
        onDispose: ((viewModel) {
          viewModel.controller1.dispose();
          viewModel.controller2.dispose();
          viewModel.controller3.dispose();
          viewModel.controller4.dispose();
          viewModel.controller5.dispose();
        }),
        builder: (context, viewModel, child) {
          Widget mobileButton() {
            return FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  viewModel.navigationService
                      .navigateToView(const BookAppointmentPage());
                });
          }

          Widget desktopButton() {
            return FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                onPressed: () {
                  viewModel.navigationService
                      .navigateToView(const BookAppointmentPage());
                },
                label: const Text("BOOK NOW"));
          }

          showDatePickerW() {
            showDatePicker(
                    context: context,
                    initialDate: viewModel.datePicked,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100))
                .then((DateTime? date) {
              if (date != null) {
                viewModel.controller1.displayDate = date;
                viewModel.controller2.displayDate = date;
                viewModel.controller3.displayDate = date;
                viewModel.controller4.displayDate = date;
                viewModel.controller5.displayDate = date;
              } else {
                viewModel.controller1.displayDate = DateTime.now();
                viewModel.controller2.displayDate = DateTime.now();
                viewModel.controller3.displayDate = DateTime.now();
                viewModel.controller4.displayDate = DateTime.now();
                viewModel.controller5.displayDate = DateTime.now();
              }
            });
          }

          return DefaultTabController(
            initialIndex: 0,
            length: 5,
            child: Scaffold(
              floatingActionButton: viewModel.bookingEnabled
                  ? isMobile(context)
                      ? mobileButton()
                      : desktopButton()
                  : const SizedBox.shrink(),
              appBar: AppBar(
                leading: ezDrawerButton(context),
                title: const Text("Appointments"),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: ColoredBox(
                    color: Theme.of(context).primaryColor.darken(),
                    child: LayoutBuilder(builder: (context, constraints) {
                      final double width =
                          max(((constraints.maxWidth / 5) - 32), 110);

                      Widget tab(String title) {
                        return Tab(
                          child: SizedBox(
                            width: width,
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      return TabBar(
                        isScrollable: true,
                        tabs: [
                          tab("All (${viewModel.clientAppointments.length})"),
                          tab("Upcoming (${viewModel.clientAppointmentsUpcoming.length})"),
                          tab("Completed (${viewModel.clientAppointmentsCompleted.length})"),
                          tab("Missed (${viewModel.clientAppointmentsMissed.length})"),
                          tab("Cancelled (${viewModel.clientAppointmentsCancelled.length})"),
                        ],
                      );
                    }),
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => showDatePickerW(),
                    child: const Icon(
                      Icons.date_range,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              body: viewModel.isBusy
                  ? const Center(child: CircularProgressIndicator())
                  : const TabBarView(
                      children: [
                        Tab1(),
                        Tab2(),
                        Tab3(),
                        Tab4(),
                        Tab5(),
                      ],
                    ),
            ),
          );
        });
  }
}

class Tab1 extends StatefulWidget {
  const Tab1({Key? key}) : super(key: key);
  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = getParentViewModel<AppointmentViewModel>(context);
    return SfCalendarTemplateWidget(
        controller: viewModel.controller1,
        dataSource: MeetingDataSource(viewModel.clientAppointments),
        onViewChanged: viewModel.viewChanged,
        onTap: viewModel.calendarTapped);
  }
}

class Tab2 extends StatefulWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = getParentViewModel<AppointmentViewModel>(context);

    return SfCalendarTemplateWidget(
        controller: viewModel.controller2,
        dataSource: MeetingDataSource(viewModel.clientAppointmentsUpcoming),
        onViewChanged: viewModel.viewChanged,
        onTap: viewModel.calendarTapped);
  }
}

class Tab3 extends StatefulWidget {
  const Tab3({Key? key}) : super(key: key);

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = getParentViewModel<AppointmentViewModel>(context);

    return SfCalendarTemplateWidget(
        controller: viewModel.controller3,
        dataSource: MeetingDataSource(viewModel.clientAppointmentsCompleted),
        onViewChanged: viewModel.viewChanged,
        onTap: viewModel.calendarTapped);
  }
}

class Tab4 extends StatefulWidget {
  const Tab4({Key? key}) : super(key: key);

  @override
  State<Tab4> createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = getParentViewModel<AppointmentViewModel>(context);

    return SfCalendarTemplateWidget(
        controller: viewModel.controller4,
        dataSource: MeetingDataSource(viewModel.clientAppointmentsMissed),
        onViewChanged: viewModel.viewChanged,
        onTap: viewModel.calendarTapped);
  }
}

class Tab5 extends StatefulWidget {
  const Tab5({Key? key}) : super(key: key);

  @override
  State<Tab5> createState() => _Tab5State();
}

class _Tab5State extends State<Tab5> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final viewModel = getParentViewModel<AppointmentViewModel>(context);

    return SfCalendarTemplateWidget(
        controller: viewModel.controller5,
        dataSource: MeetingDataSource(viewModel.clientAppointmentsCancelled),
        onViewChanged: viewModel.viewChanged,
        onTap: viewModel.calendarTapped);
  }
}
