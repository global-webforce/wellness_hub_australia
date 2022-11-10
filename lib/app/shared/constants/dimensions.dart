import 'dart:math';

import 'package:flutter/cupertino.dart';

class Dimens {
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `LocalStorageKey()` accidentally
  Dimens._();

  // the properties are static so that we can use them without a class instance
  // e.g. can be retrieved by `LocalStorageKey.saveUserId`.

  static EdgeInsets sliverHeaderPadding(BoxConstraints constraints) {
    final double padding = max((constraints.maxWidth - 1000) / 2, 0) > 15
        ? max((constraints.maxWidth - 1000) / 2, 0)
        : 15;
    return EdgeInsets.fromLTRB(padding, 15, padding, 0);
  }

  static EdgeInsets sliverPadding(BoxConstraints constraints) {
    return EdgeInsets.symmetric(
        vertical: 15,
        horizontal: max((constraints.maxWidth - 1000) / 2, 0) > 15
            ? max((constraints.maxWidth - 1000) / 2, 0)
            : 15);
  }

  static EdgeInsets sliverPadding800(BoxConstraints constraints) {
    return EdgeInsets.symmetric(
        vertical: 15,
        horizontal: max((constraints.maxWidth - 800) / 2, 0) > 15
            ? max((constraints.maxWidth - 800) / 2, 0)
            : 15);
  }

  static const pagePadding = EdgeInsets.all(15);
}
