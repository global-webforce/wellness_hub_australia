import 'package:ez_core/ez_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/models/appointment.model.dart' as appt;
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class SfCalendarTemplateWidget extends StatelessWidget {
  final CalendarController? controller;
  final CalendarDataSource<Object?>? dataSource;
  final void Function(ViewChangedDetails)? onViewChanged;
  final void Function(CalendarTapDetails)? onTap;
  const SfCalendarTemplateWidget(
      {Key? key,
      this.controller,
      this.dataSource,
      this.onViewChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calendarTextStyle = TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: Theme.of(context).textTheme.bodyText1!.color);

    return SfCalendar(
      controller: controller,
      dataSource: dataSource,
      onViewChanged: onViewChanged,
      onTap: onTap,
      backgroundColor: Theme.of(context).cardColor,
      view: CalendarView.schedule,
      initialDisplayDate: DateTime.now(),
      firstDayOfWeek: 1, // Monday
      showNavigationArrow: true,
      showCurrentTimeIndicator: true,
      monthViewSettings: MonthViewSettings(
          showAgenda: true,
          monthCellStyle: MonthCellStyle(
              textStyle: calendarTextStyle,
              leadingDatesTextStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.grey),
              trailingDatesTextStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.grey)),
          agendaStyle: AgendaStyle(
              dayTextStyle: calendarTextStyle,
              dateTextStyle: calendarTextStyle,
              appointmentTextStyle: calendarTextStyle)),
      headerStyle: CalendarHeaderStyle(textStyle: calendarTextStyle),
      viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: calendarTextStyle, dateTextStyle: calendarTextStyle),
      timeSlotViewSettings: TimeSlotViewSettings(
        timelineAppointmentHeight: 40,
        timeTextStyle: calendarTextStyle,
      ),
      scheduleViewSettings: ScheduleViewSettings(
        appointmentTextStyle: calendarTextStyle,
        dayHeaderSettings: DayHeaderSettings(
            dateTextStyle: calendarTextStyle, dayTextStyle: calendarTextStyle),
        monthHeaderSettings:
            MonthHeaderSettings(monthTextStyle: calendarTextStyle),
        weekHeaderSettings:
            WeekHeaderSettings(weekTextStyle: calendarTextStyle),
      ),
      appointmentTextStyle: calendarTextStyle,
    );
  }
}

/*
CALENDAR
https://www.syncfusion.com/kb/11529/how-to-add-a-custom-appointments-or-objects-in-the-flutter-calendar
*/

class MeetingDataSource extends CalendarDataSource<appt.Appointment> {
  final _appService = locator<AppService>();
  MeetingDataSource(List<appt.Appointment> source) {
    appointments = source;
  }

  @override
  Color getColor(int index) {
    final String? status = appointments![index].status;
    //final DateTime? startDate = appointments![index].startDate;

    switch (status) {
      case "Confirmed":
        return Colors.blue;
      case "Completed":
        return Colors.green;
      case "Missed":
        return Colors.orange;
      case "Cancelled":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endDate;
  }

  @override
  Object? getId(int index) {
    return appointments![index].id;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startDate;
  }

  @override
  String getSubject(int index) {
    final appt.Appointment a = appointments![index];
    final double total = a.total ?? 0;
    return _appService.user?.role == "member"
        ? "${a.fieldDetails?.title} w/ ${a.serviceProvider?.firstName} ${a.serviceProvider?.lastName} - ${total.moneyFormat()} via ${a.paymentType} (${a.paid == 1 ? "Paid" : "Unpaid"})"
        : "${a.fieldDetails?.title} w/ client ${a.member?.firstName} ${a.member?.lastName} - ${total.moneyFormat()} via ${a.paymentType} (${a.paid == 1 ? "Paid" : "Unpaid"})";
  }
}
