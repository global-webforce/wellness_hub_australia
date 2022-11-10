import 'package:flutter/material.dart';

class KConfig {
  String? _logoImageUrl;
  get logoImageUrl => this._logoImageUrl;
  set logoImageUrl(value) => this._logoImageUrl = value;

  String? _appName;
  get appName => this._appName;
  set appName(value) => this._appName = value;

  Widget? _userAccountDrawer;
  get userAccountDrawer => this._userAccountDrawer;
  set userAccountDrawer(value) => this._userAccountDrawer = value;

  Color? _primaryColor;
  get primaryColor => this._primaryColor;
  set primaryColor(value) => this._primaryColor = value;

  Color? _badgeColor;
  get badgeColor => this._badgeColor;
  set badgeColor(value) => this._badgeColor = value;

  TextStyle? _badgeTextStyle;
  get badgeTextStyle => this._badgeTextStyle;
  set badgeTextStyle(value) => this._badgeTextStyle = value;

  Color? _activeMenuColor;
  get activeMenuColor => this._activeMenuColor;
  set activeMenuColor(value) => this._activeMenuColor = value;
}
