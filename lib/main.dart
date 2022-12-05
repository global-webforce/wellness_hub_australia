import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_bottomsheet_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_dialog_ui.dart';
import 'package:wellness_hub_australia/app/shared/ui/setup_snackbar_ui.dart';
import 'package:wellness_hub_australia/app/app.theme_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setupLocator();
  await ThemeManager.initialise();
  await setupSnackBarUI();
  await setupDialogUI();
  await setupBottomSheetUI();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(
      desktop: 1100,
      tablet: 650,
      watch: 300,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRoute(StackedService.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      viewModelBuilder: () => locator<AppViewModel>(),
      onModelReady: (viewModel) async {
        await viewModel.fetchUser();
      },
      disposeViewModel: false,
      fireOnModelReadyOnce: true,
      builder: (context, viewModel, child) {
        return ThemeBuilder(
            defaultThemeMode: ThemeMode.system,
            lightTheme: ThemeSettings.lightTheme,
            darkTheme: ThemeSettings.darkTheme,
            builder: (context, regularTheme, darkTheme, themeMode) {
              return MaterialApp.router(
                title: "Wellness Hub Australia",
                theme: regularTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                scrollBehavior: MyCustomScrollBehavior(),
                localizationsDelegates: const [
                  FormBuilderLocalizations.delegate
                ],
                debugShowCheckedModeBanner: false,
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.declarativeDelegate(routes: (ctx) {
                  if (viewModel.isBusy) {
                    return [];
                  } else {
                    if (!kIsWeb) {
                      Future.delayed(const Duration(seconds: 1), () {
                        FlutterNativeSplash.remove();
                      });
                      if (viewModel.isOnboarded != true) {
                        return [const OnboardingRoute()];
                      }
                    }
                    if (viewModel.user != null) {
                      if (viewModel.isMember()) {
                        return [const ClientScaffoldRoute()];
                      }
                      if (viewModel.isServiceProvider()) {
                        return [const ServiceProviderScaffoldRoute()];
                      }
                    }
                    return [AuthRoute(key: UniqueKey())];
                  }
                }),
              );
            });
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
