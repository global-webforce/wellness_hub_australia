import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';

Widget? ezDrawerToggle(BuildContext context) {
  final width = screenWidth(context);
  return (width < 1100)
      ? IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        )
      : null;
}
