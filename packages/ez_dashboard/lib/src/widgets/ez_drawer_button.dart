import 'package:flutter/material.dart';

Widget? ezDrawerButton(context) {
  return (MediaQuery.of(context).size.width > 1062)
      ? null
      : IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
}
