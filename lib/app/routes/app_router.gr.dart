// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:auto_route/empty_router_widgets.dart' as _i18;
import 'package:flutter/material.dart' as _i26;

import '../../dashboards/admin_dashboard/pages/admin_scaffold_page.dart' as _i6;
import '../../dashboards/client_dashboard/pages/client_home_page.dart' as _i11;
import '../../dashboards/client_dashboard/pages/client_scaffold_page.dart'
    as _i4;
import '../../dashboards/service_provider_dashboard/pages/service_provider_home_page.dart'
    as _i19;
import '../../dashboards/service_provider_dashboard/pages/service_provider_scaffold_page.dart'
    as _i5;
import '../../features/appointments/appointments/pages/appointments_page.dart'
    as _i12;
import '../../features/appointments/book_appointment/pages/choose_service_provider_page.dart'
    as _i14;
import '../../features/authentication/pages/auth_page.dart' as _i2;
import '../../features/authentication/pages/loading_page.dart' as _i1;
import '../../features/authentication/pages/login_page.dart' as _i8;
import '../../features/authentication/pages/onboarding_page.dart' as _i3;
import '../../features/authentication/pages/register_client_page.dart' as _i9;
import '../../features/authentication/pages/register_service_provider_page.dart'
    as _i10;
import '../../features/authentication/pages/welcome_page.dart' as _i7;
import '../../features/chat/pages/chats_page.dart' as _i13;
import '../../features/companies/pages/companies_page.dart' as _i22;
import '../../features/profile/basic_profile_page.dart' as _i23;
import '../../features/profile/client_profile_page.dart' as _i16;
import '../../features/profile/service_provider_profile_page.dart' as _i20;
import '../../features/push_notifications/pages/push_notifications_page.dart'
    as _i15;
import '../../features/settings/pages/admin_settings_page.dart' as _i24;
import '../../features/settings/pages/client_settings_page.dart' as _i17;
import '../../features/settings/pages/service_provider_settings_page.dart'
    as _i21;

class AppRoute extends _i25.RootStackRouter {
  AppRoute([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(key: args.key),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientScaffoldRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ClientScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderScaffoldRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ServiceProviderScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminScaffoldRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.WelcomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterClientRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.RegisterClientPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterSPRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterSPPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientHomeRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.ClientHomePage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppointmentsRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.AppointmentsPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.ChatsPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChooseServiceProviderRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseServiceProviderRouteArgs>(
          orElse: () => const ChooseServiceProviderRouteArgs());
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: _i14.ChooseServiceProviderPage(
          key: args.key,
          onChanged: args.onChanged,
        ),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PushNotificationsRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.PushNotificationsPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientProfileRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.ClientProfilePage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientSettingsRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i17.ClientSettingsPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderHomeRouter.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderHomeRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i19.ServiceProviderHomePage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderProfileRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i20.ServiceProviderProfilePage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderSettingsRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i21.ServiceProviderSettingsPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminHomeRouter.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CompaniesRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i22.CompaniesPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BasicProfileRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i23.BasicProfilePage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminSettingsRoute.name: (routeData) {
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i24.AdminSettingsPage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i25.RouteConfig> get routes => [
        _i25.RouteConfig(
          LoadingRoute.name,
          path: '/',
        ),
        _i25.RouteConfig(
          AuthRoute.name,
          path: '/',
          children: [
            _i25.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: AuthRoute.name,
            ),
            _i25.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRoute.name,
            ),
            _i25.RouteConfig(
              RegisterClientRoute.name,
              path: 'register',
              parent: AuthRoute.name,
            ),
            _i25.RouteConfig(
              RegisterSPRoute.name,
              path: 'apply-service-provider',
              parent: AuthRoute.name,
            ),
            _i25.RouteConfig(
              '*#redirect',
              path: '*',
              parent: AuthRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i25.RouteConfig(
          OnboardingRoute.name,
          path: 'onboard',
        ),
        _i25.RouteConfig(
          ClientScaffoldRoute.name,
          path: '/',
          children: [
            _i25.RouteConfig(
              ClientHomeRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'home'},
            ),
            _i25.RouteConfig(
              AppointmentsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'appointments'},
            ),
            _i25.RouteConfig(
              ChatsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'chat'},
            ),
            _i25.RouteConfig(
              ChooseServiceProviderRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'service_providers'},
            ),
            _i25.RouteConfig(
              PushNotificationsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'notifications'},
            ),
            _i25.RouteConfig(
              ClientProfileRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'clientProfile'},
            ),
            _i25.RouteConfig(
              ClientSettingsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'settings'},
            ),
            _i25.RouteConfig(
              '*#redirect',
              path: '*',
              parent: ClientScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i25.RouteConfig(
          ServiceProviderScaffoldRoute.name,
          path: '/',
          children: [
            _i25.RouteConfig(
              ServiceProviderHomeRouter.name,
              path: '',
              parent: ServiceProviderScaffoldRoute.name,
              children: [
                _i25.RouteConfig(
                  ServiceProviderHomeRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'home'},
                ),
                _i25.RouteConfig(
                  AppointmentsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'appointments'},
                ),
                _i25.RouteConfig(
                  ChatsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'chat'},
                ),
                _i25.RouteConfig(
                  PushNotificationsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'notifications'},
                ),
                _i25.RouteConfig(
                  ServiceProviderProfileRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'spProfile'},
                ),
                _i25.RouteConfig(
                  ServiceProviderSettingsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'settings'},
                ),
              ],
            ),
            _i25.RouteConfig(
              '*#redirect',
              path: '*',
              parent: ServiceProviderScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i25.RouteConfig(
          AdminScaffoldRoute.name,
          path: '/',
          children: [
            _i25.RouteConfig(
              AdminHomeRouter.name,
              path: '',
              parent: AdminScaffoldRoute.name,
              children: [
                _i25.RouteConfig(
                  CompaniesRoute.name,
                  path: '',
                  parent: AdminHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'home'},
                ),
                _i25.RouteConfig(
                  PushNotificationsRoute.name,
                  path: '',
                  parent: AdminHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'notifications'},
                ),
                _i25.RouteConfig(
                  BasicProfileRoute.name,
                  path: '',
                  parent: AdminHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'profile'},
                ),
                _i25.RouteConfig(
                  AdminSettingsRoute.name,
                  path: '',
                  parent: AdminHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'settings'},
                ),
              ],
            ),
            _i25.RouteConfig(
              '*#redirect',
              path: '*',
              parent: AdminScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoadingPage]
class LoadingRoute extends _i25.PageRouteInfo<void> {
  const LoadingRoute()
      : super(
          LoadingRoute.name,
          path: '/',
        );

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i25.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          path: '/',
          args: AuthRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i25.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: 'onboard',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.ClientScaffoldPage]
class ClientScaffoldRoute extends _i25.PageRouteInfo<void> {
  const ClientScaffoldRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ClientScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ClientScaffoldRoute';
}

/// generated route for
/// [_i5.ServiceProviderScaffoldPage]
class ServiceProviderScaffoldRoute extends _i25.PageRouteInfo<void> {
  const ServiceProviderScaffoldRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ServiceProviderScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ServiceProviderScaffoldRoute';
}

/// generated route for
/// [_i6.AdminScaffoldPage]
class AdminScaffoldRoute extends _i25.PageRouteInfo<void> {
  const AdminScaffoldRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AdminScaffoldRoute';
}

/// generated route for
/// [_i7.WelcomePage]
class WelcomeRoute extends _i25.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i9.RegisterClientPage]
class RegisterClientRoute extends _i25.PageRouteInfo<void> {
  const RegisterClientRoute()
      : super(
          RegisterClientRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterClientRoute';
}

/// generated route for
/// [_i10.RegisterSPPage]
class RegisterSPRoute extends _i25.PageRouteInfo<void> {
  const RegisterSPRoute()
      : super(
          RegisterSPRoute.name,
          path: 'apply-service-provider',
        );

  static const String name = 'RegisterSPRoute';
}

/// generated route for
/// [_i11.ClientHomePage]
class ClientHomeRoute extends _i25.PageRouteInfo<void> {
  const ClientHomeRoute()
      : super(
          ClientHomeRoute.name,
          path: '',
        );

  static const String name = 'ClientHomeRoute';
}

/// generated route for
/// [_i12.AppointmentsPage]
class AppointmentsRoute extends _i25.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(
          AppointmentsRoute.name,
          path: '',
        );

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i13.ChatsPage]
class ChatsRoute extends _i25.PageRouteInfo<void> {
  const ChatsRoute()
      : super(
          ChatsRoute.name,
          path: '',
        );

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i14.ChooseServiceProviderPage]
class ChooseServiceProviderRoute
    extends _i25.PageRouteInfo<ChooseServiceProviderRouteArgs> {
  ChooseServiceProviderRoute({
    _i26.Key? key,
    dynamic Function(int)? onChanged,
  }) : super(
          ChooseServiceProviderRoute.name,
          path: '',
          args: ChooseServiceProviderRouteArgs(
            key: key,
            onChanged: onChanged,
          ),
        );

  static const String name = 'ChooseServiceProviderRoute';
}

class ChooseServiceProviderRouteArgs {
  const ChooseServiceProviderRouteArgs({
    this.key,
    this.onChanged,
  });

  final _i26.Key? key;

  final dynamic Function(int)? onChanged;

  @override
  String toString() {
    return 'ChooseServiceProviderRouteArgs{key: $key, onChanged: $onChanged}';
  }
}

/// generated route for
/// [_i15.PushNotificationsPage]
class PushNotificationsRoute extends _i25.PageRouteInfo<void> {
  const PushNotificationsRoute()
      : super(
          PushNotificationsRoute.name,
          path: '',
        );

  static const String name = 'PushNotificationsRoute';
}

/// generated route for
/// [_i16.ClientProfilePage]
class ClientProfileRoute extends _i25.PageRouteInfo<void> {
  const ClientProfileRoute()
      : super(
          ClientProfileRoute.name,
          path: '',
        );

  static const String name = 'ClientProfileRoute';
}

/// generated route for
/// [_i17.ClientSettingsPage]
class ClientSettingsRoute extends _i25.PageRouteInfo<void> {
  const ClientSettingsRoute()
      : super(
          ClientSettingsRoute.name,
          path: '',
        );

  static const String name = 'ClientSettingsRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class ServiceProviderHomeRouter extends _i25.PageRouteInfo<void> {
  const ServiceProviderHomeRouter({List<_i25.PageRouteInfo>? children})
      : super(
          ServiceProviderHomeRouter.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'ServiceProviderHomeRouter';
}

/// generated route for
/// [_i19.ServiceProviderHomePage]
class ServiceProviderHomeRoute extends _i25.PageRouteInfo<void> {
  const ServiceProviderHomeRoute()
      : super(
          ServiceProviderHomeRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderHomeRoute';
}

/// generated route for
/// [_i20.ServiceProviderProfilePage]
class ServiceProviderProfileRoute extends _i25.PageRouteInfo<void> {
  const ServiceProviderProfileRoute()
      : super(
          ServiceProviderProfileRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderProfileRoute';
}

/// generated route for
/// [_i21.ServiceProviderSettingsPage]
class ServiceProviderSettingsRoute extends _i25.PageRouteInfo<void> {
  const ServiceProviderSettingsRoute()
      : super(
          ServiceProviderSettingsRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderSettingsRoute';
}

/// generated route for
/// [_i18.EmptyRouterPage]
class AdminHomeRouter extends _i25.PageRouteInfo<void> {
  const AdminHomeRouter({List<_i25.PageRouteInfo>? children})
      : super(
          AdminHomeRouter.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'AdminHomeRouter';
}

/// generated route for
/// [_i22.CompaniesPage]
class CompaniesRoute extends _i25.PageRouteInfo<void> {
  const CompaniesRoute()
      : super(
          CompaniesRoute.name,
          path: '',
        );

  static const String name = 'CompaniesRoute';
}

/// generated route for
/// [_i23.BasicProfilePage]
class BasicProfileRoute extends _i25.PageRouteInfo<void> {
  const BasicProfileRoute()
      : super(
          BasicProfileRoute.name,
          path: '',
        );

  static const String name = 'BasicProfileRoute';
}

/// generated route for
/// [_i24.AdminSettingsPage]
class AdminSettingsRoute extends _i25.PageRouteInfo<void> {
  const AdminSettingsRoute()
      : super(
          AdminSettingsRoute.name,
          path: '',
        );

  static const String name = 'AdminSettingsRoute';
}
