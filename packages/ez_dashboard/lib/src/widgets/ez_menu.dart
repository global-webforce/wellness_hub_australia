import 'dart:convert';

import 'package:flutter/material.dart';

class EzMenu {
  final String title;
  final IconData icon;
  final dynamic route;
  final String prefixPath;
  final bool isActive;
  final int notificationCount;
  EzMenu({
    required this.title,
    required this.icon,
    required this.route,
    required this.prefixPath,
    this.isActive = false,
    this.notificationCount = 0,
  });

  EzMenu copyWith({
    String? title,
    IconData? icon,
    dynamic route,
    String? prefixPath,
    bool? isActive,
    int? notificationCount,
  }) {
    return EzMenu(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      route: route ?? this.route,
      prefixPath: prefixPath ?? this.prefixPath,
      isActive: isActive ?? this.isActive,
      notificationCount: notificationCount ?? this.notificationCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon.codePoint,
      'route': route,
      'prefixPath': prefixPath,
      'isActive': isActive,
      'notificationCount': notificationCount,
    };
  }

  factory EzMenu.fromMap(Map<String, dynamic> map) {
    return EzMenu(
      title: map['title'] ?? '',
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      route: map['route'] ?? null,
      prefixPath: map['prefixPath'] ?? '',
      isActive: map['isActive'] ?? false,
      notificationCount: map['notificationCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory EzMenu.fromJson(String source) => EzMenu.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EzMenu(title: $title, icon: $icon, route: $route, prefixPath: $prefixPath, isActive: $isActive, notificationCount: $notificationCount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EzMenu &&
        other.title == title &&
        other.icon == icon &&
        other.route == route &&
        other.prefixPath == prefixPath &&
        other.isActive == isActive &&
        other.notificationCount == notificationCount;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        icon.hashCode ^
        route.hashCode ^
        prefixPath.hashCode ^
        isActive.hashCode ^
        notificationCount.hashCode;
  }
}
