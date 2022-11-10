import 'package:flutter/material.dart';

class EzMenuPageWidget {
  final String title;
  final IconData icon;
  final Widget pageWidget;
  final int notif;
  EzMenuPageWidget({
    required this.title,
    required this.icon,
    required this.pageWidget,
    required this.notif,
  });

  EzMenuPageWidget copyWith({
    String? title,
    IconData? icon,
    Widget? pageWidget,
    int? notif,
  }) {
    return EzMenuPageWidget(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      pageWidget: pageWidget ?? this.pageWidget,
      notif: notif ?? this.notif,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EzMenuPageWidget &&
        other.title == title &&
        other.icon == icon &&
        other.pageWidget == pageWidget &&
        other.notif == notif;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        icon.hashCode ^
        pageWidget.hashCode ^
        notif.hashCode;
  }
}
