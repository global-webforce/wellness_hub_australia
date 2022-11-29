// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_themes/src/theme_service.dart';
import 'package:wellness_hub_australia/app/api/api_service.dart';

import '../dashboards/client_dashboard/viewmodels/client_home_page_viewmodel.dart';
import '../dashboards/client_dashboard/viewmodels/client_scaffold_page_viewmodel.dart';
import '../dashboards/service_provider_dashboard/viewmodels/service_provider_home_page_viewmodel.dart';
import '../dashboards/service_provider_dashboard/viewmodels/service_provider_scaffold_page_viewmodel.dart';
import '../features/appointments/appointments/services/appointments_service.dart';
import '../features/appointments/appointments/services/appointments_service_laravel.dart';
import '../features/appointments/appointments/viewmodels/appointments_viewmodel.dart';
import '../features/appointments/book_appointment/book_appointment_viewmodel.dart';
import '../features/badges/services/badges_service.dart';
import '../features/badges/services/badges_service_laravel.dart';
import '../features/badges/viewmodels/badges_viewmodel.dart';
import '../features/chat/services/chat_service.dart';
import '../features/chat/services/chat_service_laravel.dart';
import '../features/chat/viewmodels/chat_viewmodel.dart';
import '../features/credentials/services/credentials_service.dart';
import '../features/credentials/services/credentials_service_laravel.dart';
import '../features/credentials/viewmodels/credentials_viewmodel.dart';
import '../features/custom_links/services/custom_link_service.dart';
import '../features/custom_links/services/custom_link_service_laravel.dart';
import '../features/custom_links/viewmodels/custom_links_viewmodel.dart';
import '../features/fields/services/fields_service.dart';
import '../features/fields/services/fields_service_laravel.dart';
import '../features/fields/viewmodels/fields_viewmodel.dart';
import '../features/offered_services/services/offered_services_service.dart';
import '../features/offered_services/services/offered_services_service_laravel.dart';
import '../features/offered_services/viewmodels/offered_services_viewmodel.dart';
import '../features/pillars/pillars_service.dart';
import '../features/pillars/pillars_service_laravel.dart';
import '../features/pillars/pillars_viewmodel.dart';
import '../features/push_notifications/services/push_notifications_laravel.dart';
import '../features/push_notifications/services/push_notifications_service.dart';
import '../features/push_notifications/viewmodels/push_notifications_viewmodel.dart';
import '../features/service_providers/services/service_providers_service.dart';
import '../features/service_providers/services/service_providers_service_laravel.dart';
import '../features/service_providers/viewmodels/service_providers_viewmodel.dart';
import '../features/service_schedules/services/service_schedule_service.dart';
import '../features/service_schedules/services/service_schedule_service_laravel.dart';
import '../features/service_schedules/viewmodels/service_schedule_viewmodel.dart';
import '../features/task_alarm/services/task_alarm_service.dart';
import '../features/task_alarm/services/task_alarm_service_laravel.dart';
import '../features/task_alarm/viewmodels/task_alarm_viewmodel.dart';
import '../features/tasks/services/task_service.dart';
import '../features/tasks/services/task_service_laravel.dart';
import '../features/tasks/viewmodels/tasks_viewmodel.dart';
import '../features_core/local_storage_service/local_storage_service.dart';
import 'app_service.dart';
import 'app_view_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => AppService());

  locator.registerSingleton(NavigationService());
  locator.registerLazySingleton(() => ThemeService.getInstance());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => ApiService());

  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton(localStorageService);

  locator.registerLazySingleton<FieldsService>(() => FieldsServiceLaravel());
  locator.registerLazySingleton<PillarService>(() => PillarServiceLaravel());
  locator.registerLazySingleton<TaskService>(() => TaskServiceLaravel());
  locator
      .registerLazySingleton<TaskAlarmService>(() => TaskAlarmServiceLaravel());
  locator.registerLazySingleton<BadgesService>(() => BadgesServiceLaravel());
  locator.registerLazySingleton<CustomLinkService>(
      () => CustomLinkServiceLaravel());
  locator.registerLazySingleton<PushNotificationsService>(
      () => PushNotificationsServiceLaravel());
  locator.registerLazySingleton<ChatService>(() => ChatServiceLaravel());
  locator.registerLazySingleton<ServiceProvidersService>(
      () => ServiceProvidersServiceLaravel());
  locator.registerLazySingleton<CredentialsService>(
      () => CredentialsServiceLaravel());
  locator.registerLazySingleton<OfferedServicesService>(
      () => OfferedServicesServiceLaravel());
  locator.registerLazySingleton<ServiceSchedulesService>(
      () => ServiceSchedulesServiceLaravel());
  locator.registerLazySingleton<AppointmentsService>(
      () => AppointmentsServiceLaravel());
  locator.registerFactory(() => AppViewModel());
  locator.registerFactory(() => PillarsViewModel());
  locator.registerFactory(() => TasksViewModel());
  locator.registerFactory(() => TaskAlarmViewModel());
  locator.registerFactory(() => CustomLinksViewModel());
  locator.registerFactory(() => ServiceProvidersViewModel());
  locator.registerFactory(() => CredentialsViewModel());
  locator.registerFactory(() => ServiceSchedulesViewModel());
  locator.registerFactory(() => BookAppointmentViewModel());
  locator.registerFactory(() => AppointmentViewModel());
  locator.registerFactory(() => OfferedServicesViewModel());
  locator.registerFactory(() => BadgesViewModel());
  locator.registerFactory(() => ChatViewModel());
  locator.registerFactory(() => PushNotificationsViewModel());
  locator.registerFactory(() => FieldsViewModel());
  locator.registerFactory(() => ClientScaffoldPageViewModel());
  locator.registerFactory(() => ClientHomePageViewModel());
  locator.registerFactory(() => ServiceProviderScaffoldPageViewModel());
  locator.registerFactory(() => ServiceProviderHomePageViewModel());
}
