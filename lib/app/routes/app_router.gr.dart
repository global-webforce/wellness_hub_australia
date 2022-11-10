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
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:auto_route/empty_router_widgets.dart' as _i17;
import 'package:flutter/material.dart' as _i22;

import '../../dashboards/client_dashboard/pages/client_home_page.dart' as _i10;
import '../../dashboards/client_dashboard/pages/client_scaffold_page.dart'
    as _i4;
import '../../dashboards/service_provider_dashboard/pages/service_provider_home_page.dart'
    as _i18;
import '../../dashboards/service_provider_dashboard/pages/service_provider_scaffold_page.dart'
    as _i5;
import '../../features/appointments/appointments/pages/appointments_page.dart'
    as _i11;
import '../../features/appointments/book_appointment/pages/choose_service_provider_page.dart'
    as _i13;
import '../../features/authentication/pages/auth_page.dart' as _i2;
import '../../features/authentication/pages/loading_page.dart' as _i1;
import '../../features/authentication/pages/login_page.dart' as _i7;
import '../../features/authentication/pages/onboarding_page.dart' as _i3;
import '../../features/authentication/pages/register_client_page.dart' as _i8;
import '../../features/authentication/pages/register_service_provider_page.dart'
    as _i9;
import '../../features/authentication/pages/welcome_page.dart' as _i6;
import '../../features/chat/pages/chats_page.dart' as _i12;
import '../../features/profile/client_profile_page.dart' as _i15;
import '../../features/profile/service_provider_profile_page.dart' as _i19;
import '../../features/push_notifications/pages/push_notifications_page.dart'
    as _i14;
import '../../features/settings/pages/client_settings_page.dart' as _i16;
import '../../features/settings/pages/service_provider_settings_page.dart'
    as _i20;

class AppRoute extends _i21.RootStackRouter {
  AppRoute([_i22.GlobalKey<_i22.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.AuthPage(key: args.key),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientScaffoldRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ClientScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderScaffoldRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.ServiceProviderScaffoldPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.WelcomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterClientRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterClientPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterSPRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.RegisterSPPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientHomeRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.ClientHomePage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppointmentsRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.AppointmentsPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i12.ChatsPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChooseServiceProviderRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseServiceProviderRouteArgs>(
          orElse: () => const ChooseServiceProviderRouteArgs());
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: _i13.ChooseServiceProviderPage(
          key: args.key,
          onChanged: args.onChanged,
        ),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PushNotificationsRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.PushNotificationsPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientProfileRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i15.ClientProfilePage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ClientSettingsRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.ClientSettingsPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderHomeRouter.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i17.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderHomeRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i18.ServiceProviderHomePage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderProfileRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i19.ServiceProviderProfilePage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ServiceProviderSettingsRoute.name: (routeData) {
      return _i21.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i20.ServiceProviderSettingsPage(),
        transitionsBuilder: _i21.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i21.RouteConfig> get routes => [
        _i21.RouteConfig(
          LoadingRoute.name,
          path: '/',
        ),
        _i21.RouteConfig(
          AuthRoute.name,
          path: '/',
          children: [
            _i21.RouteConfig(
              WelcomeRoute.name,
              path: '',
              parent: AuthRoute.name,
            ),
            _i21.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: AuthRoute.name,
            ),
            _i21.RouteConfig(
              RegisterClientRoute.name,
              path: 'register',
              parent: AuthRoute.name,
            ),
            _i21.RouteConfig(
              RegisterSPRoute.name,
              path: 'apply-service-provider',
              parent: AuthRoute.name,
            ),
            _i21.RouteConfig(
              '*#redirect',
              path: '*',
              parent: AuthRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i21.RouteConfig(
          OnboardingRoute.name,
          path: 'onboard',
        ),
        _i21.RouteConfig(
          ClientScaffoldRoute.name,
          path: '/',
          children: [
            _i21.RouteConfig(
              ClientHomeRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'home'},
            ),
            _i21.RouteConfig(
              AppointmentsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'appointments'},
            ),
            _i21.RouteConfig(
              ChatsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'chat'},
            ),
            _i21.RouteConfig(
              ChooseServiceProviderRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'service_providers'},
            ),
            _i21.RouteConfig(
              PushNotificationsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'notifications'},
            ),
            _i21.RouteConfig(
              ClientProfileRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'clientProfile'},
            ),
            _i21.RouteConfig(
              ClientSettingsRoute.name,
              path: '',
              parent: ClientScaffoldRoute.name,
              meta: <String, dynamic>{'prefixPath': 'settings'},
            ),
            _i21.RouteConfig(
              '*#redirect',
              path: '*',
              parent: ClientScaffoldRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i21.RouteConfig(
          ServiceProviderScaffoldRoute.name,
          path: '/',
          children: [
            _i21.RouteConfig(
              ServiceProviderHomeRouter.name,
              path: '',
              parent: ServiceProviderScaffoldRoute.name,
              children: [
                _i21.RouteConfig(
                  ServiceProviderHomeRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'home'},
                ),
                _i21.RouteConfig(
                  AppointmentsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'appointments'},
                ),
                _i21.RouteConfig(
                  ChatsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'chat'},
                ),
                _i21.RouteConfig(
                  PushNotificationsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'notifications'},
                ),
                _i21.RouteConfig(
                  ServiceProviderProfileRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'spProfile'},
                ),
                _i21.RouteConfig(
                  ServiceProviderSettingsRoute.name,
                  path: '',
                  parent: ServiceProviderHomeRouter.name,
                  meta: <String, dynamic>{'prefixPath': 'settings'},
                ),
              ],
            ),
            _i21.RouteConfig(
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
/// [_i1.LoadingPage]
class LoadingRoute extends _i21.PageRouteInfo<void> {
  const LoadingRoute()
      : super(
          LoadingRoute.name,
          path: '/',
        );

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i21.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
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

  final _i22.Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i21.PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: 'onboard',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i4.ClientScaffoldPage]
class ClientScaffoldRoute extends _i21.PageRouteInfo<void> {
  const ClientScaffoldRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ClientScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ClientScaffoldRoute';
}

/// generated route for
/// [_i5.ServiceProviderScaffoldPage]
class ServiceProviderScaffoldRoute extends _i21.PageRouteInfo<void> {
  const ServiceProviderScaffoldRoute({List<_i21.PageRouteInfo>? children})
      : super(
          ServiceProviderScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'ServiceProviderScaffoldRoute';
}

/// generated route for
/// [_i6.WelcomePage]
class WelcomeRoute extends _i21.PageRouteInfo<void> {
  const WelcomeRoute()
      : super(
          WelcomeRoute.name,
          path: '',
        );

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i21.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i8.RegisterClientPage]
class RegisterClientRoute extends _i21.PageRouteInfo<void> {
  const RegisterClientRoute()
      : super(
          RegisterClientRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterClientRoute';
}

/// generated route for
/// [_i9.RegisterSPPage]
class RegisterSPRoute extends _i21.PageRouteInfo<void> {
  const RegisterSPRoute()
      : super(
          RegisterSPRoute.name,
          path: 'apply-service-provider',
        );

  static const String name = 'RegisterSPRoute';
}

/// generated route for
/// [_i10.ClientHomePage]
class ClientHomeRoute extends _i21.PageRouteInfo<void> {
  const ClientHomeRoute()
      : super(
          ClientHomeRoute.name,
          path: '',
        );

  static const String name = 'ClientHomeRoute';
}

/// generated route for
/// [_i11.AppointmentsPage]
class AppointmentsRoute extends _i21.PageRouteInfo<void> {
  const AppointmentsRoute()
      : super(
          AppointmentsRoute.name,
          path: '',
        );

  static const String name = 'AppointmentsRoute';
}

/// generated route for
/// [_i12.ChatsPage]
class ChatsRoute extends _i21.PageRouteInfo<void> {
  const ChatsRoute()
      : super(
          ChatsRoute.name,
          path: '',
        );

  static const String name = 'ChatsRoute';
}

/// generated route for
/// [_i13.ChooseServiceProviderPage]
class ChooseServiceProviderRoute
    extends _i21.PageRouteInfo<ChooseServiceProviderRouteArgs> {
  ChooseServiceProviderRoute({
    _i22.Key? key,
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

  final _i22.Key? key;

  final dynamic Function(int)? onChanged;

  @override
  String toString() {
    return 'ChooseServiceProviderRouteArgs{key: $key, onChanged: $onChanged}';
  }
}

/// generated route for
/// [_i14.PushNotificationsPage]
class PushNotificationsRoute extends _i21.PageRouteInfo<void> {
  const PushNotificationsRoute()
      : super(
          PushNotificationsRoute.name,
          path: '',
        );

  static const String name = 'PushNotificationsRoute';
}

/// generated route for
/// [_i15.ClientProfilePage]
class ClientProfileRoute extends _i21.PageRouteInfo<void> {
  const ClientProfileRoute()
      : super(
          ClientProfileRoute.name,
          path: '',
        );

  static const String name = 'ClientProfileRoute';
}

/// generated route for
/// [_i16.ClientSettingsPage]
class ClientSettingsRoute extends _i21.PageRouteInfo<void> {
  const ClientSettingsRoute()
      : super(
          ClientSettingsRoute.name,
          path: '',
        );

  static const String name = 'ClientSettingsRoute';
}

/// generated route for
/// [_i17.EmptyRouterPage]
class ServiceProviderHomeRouter extends _i21.PageRouteInfo<void> {
  const ServiceProviderHomeRouter({List<_i21.PageRouteInfo>? children})
      : super(
          ServiceProviderHomeRouter.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'ServiceProviderHomeRouter';
}

/// generated route for
/// [_i18.ServiceProviderHomePage]
class ServiceProviderHomeRoute extends _i21.PageRouteInfo<void> {
  const ServiceProviderHomeRoute()
      : super(
          ServiceProviderHomeRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderHomeRoute';
}

/// generated route for
/// [_i19.ServiceProviderProfilePage]
class ServiceProviderProfileRoute extends _i21.PageRouteInfo<void> {
  const ServiceProviderProfileRoute()
      : super(
          ServiceProviderProfileRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderProfileRoute';
}

/// generated route for
/// [_i20.ServiceProviderSettingsPage]
class ServiceProviderSettingsRoute extends _i21.PageRouteInfo<void> {
  const ServiceProviderSettingsRoute()
      : super(
          ServiceProviderSettingsRoute.name,
          path: '',
        );

  static const String name = 'ServiceProviderSettingsRoute';
}
