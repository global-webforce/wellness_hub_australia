import 'package:ez_dashboard/src/helpers/theme.dart';
import 'package:flutter/material.dart';

class EZDrawerHeader extends StatelessWidget {
  final Widget? currentAccountPicture;
  final String userName;
  final String userEmail;
  final Color? bgColor;
  const EZDrawerHeader(
      {Key? key,
      this.currentAccountPicture,
      this.userName = "N/A",
      this.userEmail = "N/A",
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: darken(const Color(0xff8A58B2)),
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentAccountPicture ?? const SizedBox.shrink(),
              const SizedBox(
                height: 15,
              ),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                userEmail,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
