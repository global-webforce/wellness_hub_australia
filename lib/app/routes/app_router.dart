import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/pages/appointments_page.dart';
import 'package:wellness_hub_australia/features/appointments/book_appointment/pages/choose_service_provider_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/loading_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/onboarding_page.dart';
import 'package:wellness_hub_australia/features/chat/pages/chats_page.dart';
import 'package:wellness_hub_australia/features/companies/pages/companies_page.dart';
import 'package:wellness_hub_australia/features/profile/client_profile_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/auth_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/login_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/register_client_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/register_service_provider_page.dart';
import 'package:wellness_hub_australia/features/authentication/pages/welcome_page.dart';
import 'package:wellness_hub_australia/dashboards/admin_dashboard/pages/admin_scaffold_page.dart';
import 'package:wellness_hub_australia/features/settings/pages/admin_settings_page.dart';
import 'package:wellness_hub_australia/dashboards/client_dashboard/pages/client_home_page.dart';
import 'package:wellness_hub_australia/dashboards/client_dashboard/pages/client_scaffold_page.dart';
import 'package:wellness_hub_australia/features/settings/pages/client_settings_page.dart';
import 'package:wellness_hub_australia/dashboards/service_provider_dashboard/pages/service_provider_home_page.dart';
import 'package:wellness_hub_australia/features/profile/service_provider_profile_page.dart';
import 'package:wellness_hub_australia/dashboards/service_provider_dashboard/pages/service_provider_scaffold_page.dart';
import 'package:wellness_hub_australia/features/settings/pages/service_provider_settings_page.dart';
import 'package:wellness_hub_australia/features/profile/basic_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../features/push_notifications/pages/push_notifications_page.dart';

class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  CustomRoute(
    path: '/',
    page: LoadingPage,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    path: '/',
    page: AuthPage,
    transitionsBuilder: TransitionsBuilders.fadeIn,
    children: [
      CustomRoute(
        page: WelcomePage,
        initial: true,
      ),
      CustomRoute(
        path: 'login',
        page: LoginPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        path: "register",
        page: RegisterClientPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        path: "apply-service-provider",
        page: RegisterSPPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
  CustomRoute(
    path: 'onboard',
    page: OnboardingPage,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  ),
  CustomRoute(
    path: "/",
    page: ClientScaffoldPage,
    children: [
      CustomRoute(
        initial: true,
        path: "",
        page: ClientHomePage,
        meta: {
          'prefixPath': 'home',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        initial: true,
        path: "",
        page: AppointmentsPage,
        meta: {
          'prefixPath': 'appointments',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        initial: true,
        path: "",
        page: ChatsPage,
        meta: {
          'prefixPath': 'chat',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        initial: true,
        path: "",
        page: ChooseServiceProviderPage,
        meta: {
          'prefixPath': 'service_providers',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        initial: true,
        path: "",
        page: PushNotificationsPage,
        meta: {
          'prefixPath': 'notifications',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        path: "",
        page: ClientProfilePage,
        meta: {
          'prefixPath': 'clientProfile',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      CustomRoute(
        path: "",
        page: ClientSettingsPage,
        meta: {
          'prefixPath': 'settings',
        },
        transitionsBuilder: TransitionsBuilders.fadeIn,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
  CustomRoute(
    path: "/",
    page: ServiceProviderScaffoldPage,
    children: [
      CustomRoute(
        path: "",
        name: "ServiceProviderHomeRouter",
        page: EmptyRouterPage,
        children: [
          CustomRoute(
            path: "",
            maintainState: false,
            page: ServiceProviderHomePage,
            meta: {
              'prefixPath': 'home',
            },
          ),
          CustomRoute(
            path: "",
            maintainState: false,
            page: AppointmentsPage,
            meta: {
              'prefixPath': 'appointments',
            },
          ),
          CustomRoute(
            initial: true,
            path: "",
            page: ChatsPage,
            meta: {
              'prefixPath': 'chat',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            initial: true,
            path: "",
            page: PushNotificationsPage,
            meta: {
              'prefixPath': 'notifications',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            path: "",
            page: ServiceProviderProfilePage,
            meta: {
              'prefixPath': 'spProfile',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            path: "",
            page: ServiceProviderSettingsPage,
            meta: {
              'prefixPath': 'settings',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
        ],
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
  CustomRoute(
    path: "/",
    page: AdminScaffoldPage,
    children: [
      CustomRoute(
        path: "",
        name: "AdminHomeRouter",
        page: EmptyRouterPage,
        children: [
          CustomRoute(
            path: "",
            maintainState: false,
            page: CompaniesPage,
            meta: {
              'prefixPath': 'home',
            },
          ),
          CustomRoute(
            initial: true,
            path: "",
            page: PushNotificationsPage,
            meta: {
              'prefixPath': 'notifications',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            path: "",
            page: BasicProfilePage,
            meta: {
              'prefixPath': 'profile',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
          CustomRoute(
            path: "",
            page: AdminSettingsPage,
            meta: {
              'prefixPath': 'settings',
            },
            transitionsBuilder: TransitionsBuilders.fadeIn,
          ),
        ],
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
])
class $AppRoute {}

Route<T> myCustomRouteBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  return PageRouteBuilder(
      fullscreenDialog: page.fullscreenDialog,
      // this is important
      settings: page,
      pageBuilder: (_, __, ___) => child);
}

Route<T> modalSheetBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  return ModalBottomSheetRoute(
    bounce: true,
    settings: page,
    expanded: false,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    ),
  );
}
