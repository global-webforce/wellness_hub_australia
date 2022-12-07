import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wellness_hub_australia/app/models/appointment.model.dart'
    as appt;
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
    final calendarTextStyle1 = TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        color: Theme.of(context).textTheme.bodyText1!.color);

    final calendarTextStyle2 = TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily, color: Colors.white);

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
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showTrailingAndLeadingDates: false,
          showAgenda: true,
          monthCellStyle: MonthCellStyle(
              textStyle: calendarTextStyle1,
              leadingDatesTextStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.grey),
              trailingDatesTextStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.grey)),
          agendaStyle: AgendaStyle(
              dayTextStyle: calendarTextStyle1,
              dateTextStyle: calendarTextStyle1,
              appointmentTextStyle: calendarTextStyle1)),
      headerStyle: CalendarHeaderStyle(textStyle: calendarTextStyle1),
      viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: calendarTextStyle1, dateTextStyle: calendarTextStyle1),
      timeSlotViewSettings: TimeSlotViewSettings(
        timelineAppointmentHeight: 40,
        timeTextStyle: calendarTextStyle1,
      ),
      scheduleViewSettings: ScheduleViewSettings(
        hideEmptyScheduleWeek: true,
        appointmentTextStyle: calendarTextStyle1,
        dayHeaderSettings: DayHeaderSettings(
            dateTextStyle: calendarTextStyle1,
            dayTextStyle: calendarTextStyle1),
        monthHeaderSettings: MonthHeaderSettings(
            monthTextStyle: calendarTextStyle2,
            backgroundColor: HexColor("#50306B"),
            height: 70,
            textAlign: TextAlign.start),
        weekHeaderSettings:
            WeekHeaderSettings(weekTextStyle: calendarTextStyle1),
      ),
      appointmentTextStyle: calendarTextStyle1,
    );
  }
}

/*
CALENDAR
https://www.syncfusion.com/kb/11529/how-to-add-a-custom-appointments-or-objects-in-the-flutter-calendar
*/

class MeetingDataSource extends CalendarDataSource<appt.Appointment> {
  //final _appService = locator<AppService>();
  MeetingDataSource(List<appt.Appointment> source) {
    appointments = source;
  }

  @override
  Color getColor(int index) {
    final String? status = appointments![index].status;
    //final DateTime? startDate = appointments![index].startDate;

    switch (status) {
      case "Confirmed":
        return HexColor("#B4DBFB");
      case "Completed":
        return HexColor("#C0E1B8");
      case "Missed":
        return HexColor("#FFDCAA");
      case "Cancelled":
        return HexColor("#FBC0BC");
      default:
        return HexColor("#DEDEDE");
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

    return "${a.fieldDetails?.title} | ${a.paymentType} (${a.paid == 1 ? "Paid" : "Unpaid"})";

    /*  return _appService.user?.role == "member"
        ? "${a.fieldDetails?.title} w/ ${a.serviceProvider?.firstName} ${a.serviceProvider?.lastName} - ${total.moneyFormat()} via ${a.paymentType} (${a.paid == 1 ? "Paid" : "Unpaid"})"
        : "${a.fieldDetails?.title} w/ client ${a.member?.firstName} ${a.member?.lastName} - ${total.moneyFormat()} via ${a.paymentType} (${a.paid == 1 ? "Paid" : "Unpaid"})"; */
  }
}
