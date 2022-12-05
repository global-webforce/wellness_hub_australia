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
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:auto_route/empty_router_widgets.dart' as _i16;
import 'package:flutter/material.dart' as _i21;

import '../../dashboards/client_dashboard/pages/client_home_page.dart' as _i9;
import '../../dashboards/client_dashboard/pages/client_scaffold_page.dart'
    as _i3;
import '../../dashboards/service_provider_dashboard/pages/service_provider_home_page.dart'
    as _i17;
import '../../dashboards/service_provider_dashboard/pages/service_provider_scaffold_page.dart'
    as _i4;
import '../../features/appointments/appointments/pages/appointments_page.dart'
    as _i10;
import '../../features/appointments/book_appointment/pages/choose_service_provider_page.dart'
    as _i12;
import '../../features/chat/pages/chats_page.dart' as _i11;
import '../../features/profile/client_profile_page.dart' as _i14;
import '../../features/profile/service_provider_profile_page.dart' as _i18;
import '../../features/push_notifications/pages/push_notifications_page.dart'
    as _i13;
import '../../features/settings/pages/client_settings_page.dart' as _i15;
import '../../features/settings/pages/service_provider_settings_page.dart'
    as _i19;
import '../core/authentication/pages/auth_page.dart' as _i1;
import '../core/authentication/pages/login_page.dart' as _i6;
import '../core/authentication/pages/onboarding_page.dart' as _i2;
import '../core/authentication/pages/register_client_page.dart' as _i7;
import '../core/authentication/pages/register_service_provider_page.dart'
    as _i8;
import '../core/authentication/pages/welcome_page.dart' as _i5;

class AppRoute extends _i20.RootStackRouter {
  AppRoute([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.AuthPage(key: args.key),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.OnboardingPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientScaffoldRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.ClientScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderScaffoldRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ServiceProviderScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.WelcomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterClientRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterClientPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterSPRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterSPPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientHomeRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.ClientHomePage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppointmentsRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.AppointmentsPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.ChatsPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChooseServiceProviderRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseServiceProviderRouteArgs>(
          orElse: () => const ChooseServiceProviderRouteArgs());
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: _i12.ChooseServiceProviderPage(
          key: args.key,
          onChanged: args.onChanged,
        ),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PushNotificationsRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i13.PushNotificationsPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientProfileRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.ClientProfilePage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientSettingsRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.ClientSettingsPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderHomeRouter.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderHomeRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i17.ServiceProviderHomePage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderProfileRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.ServiceProviderProfilePage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderSettingsRoute.name: (routeData) {
      return _i20.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i19.ServiceProviderSettingsPage(),
        transitionsBuilder: _i20.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(
          AuthRoute.name,
          path: '/',
          children: [
            _i20.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: AuthRoute.name,
            ),
            _i20.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRoute.name,
            ),
            _i20.RouteConfig(
              RegisterClientRoute.name,
              path: 'register',
              parent: AuthRoute.name,
            ),
            _i20.RouteConfig(
              RegisterSPRoute.name,
              path: 'apply-service-provider',
              parent: AuthRoute.name,
            ),
            _i20.RouteConfig(
              '*#redirect',
              path: '*',
              parent: AuthRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i20.RouteConfig(
          OnboardingRoute.name,
          path: 'onboard',
        ),
        _i20.RouteConfig(
          ClientScaffoldRoute.name,
          path: '/',
          children: [
            _i20.RouteConfig(
              ClientHomeRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'home'},
            ),
            _i20.RouteConfig(
              AppointmentsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'appointments'},
            ),
            _i20.RouteConfig(
              ChatsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'chat'},
            ),
            _i20.RouteConfig(
              ChooseServiceProviderRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'service_providers'},
            ),
            _i20.RouteConfig(
              PushNotificationsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'notifications'},
            ),
            _i20.RouteConfig(
              ClientProfileRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'clientProfile'},
            ),
            _i20.RouteConfig(
              ClientSettingsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'settings'},
            ),
            _i20.RouteConfig(
              '*#redirect',
              path: '*',
              parent: ClientScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i20.RouteConfig(
          ServiceProviderScaffoldRoute.name,
          path: '/',
          children: [
            _i20.RouteConfig(
              ServiceProviderHomeRouter.name,
              path: '',
              parent: ServiceProviderScaffoldRoute.name,
              children: [
                _i20.RouteConfig(
                  ServiceProviderHomeRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'home'},
                ),
                _i20.RouteConfig(
                  AppointmentsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'appointments'},
                ),
                _i20.RouteConfig(
                  ChatsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'chat'},
                ),
                _i20.RouteConfig(
                  PushNotificationsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'notifications'},
                ),
                _i20.RouteConfig(
                  ServiceProviderProfileRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'spProfile'},
                ),
                _i20.RouteConfig(
                  ServiceProviderSettingsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'settings'},
                ),
              ],
            ),
            _i20.RouteConfig(
              '*#redirect',
              path: '*',
              parent: ServiceProviderScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthRoute extends _i20.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
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

  final _i21.Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.OnboardingPage]
class OnboardingRoute extends _i20.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: 'onboard',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.ClientScaffoldPage]
class ClientScaffoldRoute extends _i20.PageRouteInfo<void> {
  const ClientScaffoldRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ClientScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ClientScaffoldRoute';
}

/// generated route for
/// [_i4.ServiceProviderScaffoldPage]
class ServiceProviderScaffoldRoute extends _i20.PageRouteInfo<void> {
  const ServiceProviderScaffoldRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ServiceProviderScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ServiceProviderScaffoldRoute';
}

/// generated route for
/// [_i5.WelcomePage]
class WelcomeRoute extends _i20.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.RegisterClientPage]
class RegisterClientRoute extends _i20.PageRouteInfo<void> {
  const RegisterClientRoute()
      : super(
          RegisterClientRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterClientRoute';
}

/// generated route for
/// [_i8.RegisterSPPage]
class RegisterSPRoute extends _i20.PageRouteInfo<void> {
  const RegisterSPRoute()
      : super(
          RegisterSPRoute.name,
          path: 'apply-service-provider',
        );

  static const String name = 'RegisterSPRoute';
}

/// generated route for
/// [_i9.ClientHomePage]
class ClientHomeRoute extends _i20.PageRouteInfo<void> {
  const ClientHomeRoute()
      : super(
          ClientHomeRoute.name,
          path: '',
        );

  static const String name = 'ClientHomeRoute';
}

/// generated route for
/// [_i10.AppointmentsPage]
class AppointmentsRoute extends _i20.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(
          AppointmentsRoute.name,
          path: '',
        );

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i11.ChatsPage]
class ChatsRoute extends _i20.PageRouteInfo<void> {
  const ChatsRoute()
      : super(
          ChatsRoute.name,
          path: '',
        );

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i12.ChooseServiceProviderPage]
class ChooseServiceProviderRoute
    extends _i20.PageRouteInfo<ChooseServiceProviderRouteArgs> {
  ChooseServiceProviderRoute({
    _i21.Key? key,
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

  final _i21.Key? key;

  final dynamic Function(int)? onChanged;

  @override
  String toString() {
    return 'ChooseServiceProviderRouteArgs{key: $key, onChanged: $onChanged}';
  }
}

/// generated route for
/// [_i13.PushNotificationsPage]
class PushNotificationsRoute extends _i20.PageRouteInfo<void> {
  const PushNotificationsRoute()
      : super(
          PushNotificationsRoute.name,
          path: '',
        );

  static const String name = 'PushNotificationsRoute';
}

/// generated route for
/// [_i14.ClientProfilePage]
class ClientProfileRoute extends _i20.PageRouteInfo<void> {
  const ClientProfileRoute()
      : super(
          ClientProfileRoute.name,
          path: '',
        );

  static const String name = 'ClientProfileRoute';
}

/// generated route for
/// [_i15.ClientSettingsPage]
class ClientSettingsRoute extends _i20.PageRouteInfo<void> {
  const ClientSettingsRoute()
      : super(
          ClientSettingsRoute.name,
          path: '',
        );

  static const String name = 'ClientSettingsRoute';
}

/// generated route for
/// [_i16.EmptyRouterPage]
class ServiceProviderHomeRouter extends _i20.PageRouteInfo<void> {
  const ServiceProviderHomeRouter({List<_i20.PageRouteInfo>? children})
      : super(
          ServiceProviderHomeRouter.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'ServiceProviderHomeRouter';
}

/// generated route for
/// [_i17.ServiceProviderHomePage]
class ServiceProviderHomeRoute extends _i20.PageRouteInfo<void> {
  const ServiceProviderHomeRoute()
      : super(
          ServiceProviderHomeRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderHomeRoute';
}

/// generated route for
/// [_i18.ServiceProviderProfilePage]
class ServiceProviderProfileRoute extends _i20.PageRouteInfo<void> {
  const ServiceProviderProfileRoute()
      : super(
          ServiceProviderProfileRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderProfileRoute';
}

/// generated route for
/// [_i19.ServiceProviderSettingsPage]
class ServiceProviderSettingsRoute extends _i20.PageRouteInfo<void> {
  const ServiceProviderSettingsRoute()
      : super(
          ServiceProviderSettingsRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderSettingsRoute';
}
