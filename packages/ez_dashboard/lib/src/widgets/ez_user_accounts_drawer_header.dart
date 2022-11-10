import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/material.dart';

class EzUserAccountsDrawerHeader extends StatelessWidget {
  final String imgUrl;
  final String fullName;
  final String email;
  final String bgImageUrl;
  final Color? bgColor;
  const EzUserAccountsDrawerHeader(
      {Key? key,
      required this.imgUrl,
      this.fullName = "",
      this.email = "",
      this.bgImageUrl = "",
      this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      margin: EdgeInsets.all(0),
      currentAccountPicture: EzAvatar(
        imgUrl: imgUrl,
        firstName: fullName,
      ),
      accountName: Text(
        fullName,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onBackground),
      ),
      accountEmail: Text(
        email,
        style: TextStyle(
            fontSize: 14, color: Theme.of(context).colorScheme.onBackground),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
    );
  }
}
