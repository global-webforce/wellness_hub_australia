import 'package:wellness_hub_australia/app/shared/ui/empty_display.dart';
import 'package:flutter/material.dart';

class BookingSuccessfulPage extends StatelessWidget {
  const BookingSuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
        ),
        body: const EmptyDisplay(
          icon: Icons.check_circle_outline_rounded,
          iconColor: Colors.green,
          title: "APPOINTMENT REQUEST SENT",
          subtitle:
              "This is not a confirmed appointment -at least not yet. \nYou'll get a response within 24 hours.",
        ));
  }
}
