import 'package:wellness_hub_australia/app/api/api_service.dart';
import 'package:wellness_hub_australia/app/app_service.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/dashboards/admin_dashboard/viewmodels/admin_scaffold_page_viewmodel.dart';
import 'package:wellness_hub_australia/dashboards/client_dashboard/viewmodels/client_home_page_viewmodel.dart';
import 'package:wellness_hub_australia/dashboards/client_dashboard/viewmodels/client_scaffold_page_viewmodel.dart';
import 'package:wellness_hub_australia/dashboards/service_provider_dashboard/viewmodels/service_provider_home_page_viewmodel.dart';
import 'package:wellness_hub_australia/dashboards/service_provider_dashboard/viewmodels/service_provider_scaffold_page_viewmodel.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/services/appointments_service.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/services/appointments_service_laravel.dart';
import 'package:wellness_hub_australia/features/appointments/appointments/viewmodels/appointments_viewmodel.dart';

import 'package:wellness_hub_australia/features/appointments/book_appointment/book_appointment_viewmodel.dart';

import 'package:wellness_hub_australia/features/badges/services/badges_service.dart';
import 'package:wellness_hub_australia/features/badges/services/badges_service_laravel.dart';
import 'package:wellness_hub_australia/features/badges/viewmodels/badges_viewmodel.dart';
import 'package:wellness_hub_australia/features/chat/services/chat_service.dart';
import 'package:wellness_hub_australia/features/chat/services/chat_service_laravel.dart';
import 'package:wellness_hub_australia/features/chat/viewmodels/chat_viewmodel.dart';
import 'package:wellness_hub_australia/features/companies/viewmodels/companies_viewmodel.dart';
import 'package:wellness_hub_australia/features/companies/services/company_service.dart';
import 'package:wellness_hub_australia/features/companies/services/company_service_laravel.dart';
import 'package:wellness_hub_australia/features/company_members/services/company_members_service.dart';
import 'package:wellness_hub_australia/features/company_members/services/company_members_service_laravel.dart';
import 'package:wellness_hub_australia/features/company_members/viewmodels/company_members_viewmodel.dart';
import 'package:wellness_hub_australia/features/credentials/services/credentials_service.dart';
import 'package:wellness_hub_australia/features/credentials/services/credentials_service_laravel.dart';
import 'package:wellness_hub_australia/features/credentials/viewmodels/credentials_viewmodel.dart';
import 'package:wellness_hub_australia/features/custom_links/services/custom_link_service.dart';
import 'package:wellness_hub_australia/features/custom_links/services/custom_link_service_laravel.dart';
import 'package:wellness_hub_australia/features/custom_links/viewmodels/custom_links_viewmodel.dart';
import 'package:wellness_hub_australia/features/fields/services/fields_service.dart';
import 'package:wellness_hub_australia/features/fields/services/fields_service_laravel.dart';
import 'package:wellness_hub_australia/features/fields/viewmodels/fields_viewmodel.dart';

import 'package:wellness_hub_australia/features/offered_services/services/offered_services_service.dart';
import 'package:wellness_hub_australia/features/offered_services/services/offered_services_service_laravel.dart';
import 'package:wellness_hub_australia/features/offered_services/viewmodels/offered_services_viewmodel.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_service.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_service_laravel.dart';
import 'package:wellness_hub_australia/features/pillars/pillars_viewmodel.dart';
import 'package:wellness_hub_australia/features/push_notifications/services/push_notifications_laravel.dart';
import 'package:wellness_hub_australia/features/push_notifications/services/push_notifications_service.dart';
import 'package:wellness_hub_australia/features/push_notifications/viewmodels/push_notifications_viewmodel.dart';
import 'package:wellness_hub_australia/features/service_providers/services/service_providers_service.dart';
import 'package:wellness_hub_australia/features/service_providers/services/service_providers_service_laravel.dart';
import 'package:wellness_hub_australia/features/service_providers/viewmodels/service_providers_viewmodel.dart';
import 'package:wellness_hub_australia/features/service_schedules/services/service_schedule_service.dart';
import 'package:wellness_hub_australia/features/service_schedules/services/service_schedule_service_laravel.dart';
import 'package:wellness_hub_australia/features/service_schedules/viewmodels/service_schedule_viewmodel.dart';
import 'package:wellness_hub_australia/features/task_alarm/services/task_alarm_service.dart';
import 'package:wellness_hub_australia/features/task_alarm/services/task_alarm_service_laravel.dart';
import 'package:wellness_hub_australia/features/task_alarm/viewmodels/task_alarm_viewmodel.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service.dart';
import 'package:wellness_hub_australia/features/tasks/services/task_service_laravel.dart';
import 'package:wellness_hub_australia/features/tasks/viewmodels/tasks_viewmodel.dart';
import 'package:wellness_hub_australia/features_core/local_notification_service/local_notification_service.dart';
import 'package:wellness_hub_australia/features_core/local_notification_service/local_notification_service_awesome.dart';
import 'package:wellness_hub_australia/features_core/local_storage_service/local_storage_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

@StackedApp(
  routes: [],
  logger: StackedLogger(),
  dependencies: [
    Singleton(classType: NavigationService),
    LazySingleton(
        classType: ThemeService, resolveUsing: ThemeService.getInstance),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: ApiService),
    Presolve(
      classType: LocalStorageService,
      presolveUsing: LocalStorageService.getInstance,
    ),
    LazySingleton(
      classType: AppService,
    ),
    LazySingleton(
      classType: FieldsServiceLaravel,
      asType: FieldsService,
    ),
    LazySingleton(
      classType: PillarServiceLaravel,
      asType: PillarService,
    ),
    LazySingleton(
      classType: TaskServiceLaravel,
      asType: TaskService,
    ),
    LazySingleton(
      classType: TaskAlarmServiceLaravel,
      asType: TaskAlarmService,
    ),
    LazySingleton(
      classType: BadgesServiceLaravel,
      asType: BadgesService,
    ),
    LazySingleton(
      classType: CustomLinkServiceLaravel,
      asType: CustomLinkService,
    ),
    LazySingleton(
      classType: PushNotificationsServiceLaravel,
      asType: PushNotificationsService,
    ),
    LazySingleton(
      classType: LocalNotificationServiceAwesome,
      asType: LocalNotificationService,
    ),
    LazySingleton(
      classType: ChatServiceLaravel,
      asType: ChatService,
    ),
    LazySingleton(
      classType: ServiceProvidersServiceLaravel,
      asType: ServiceProvidersService,
    ),
    LazySingleton(
      classType: CredentialsServiceLaravel,
      asType: CredentialsService,
    ),
    LazySingleton(
      classType: OfferedServicesServiceLaravel,
      asType: OfferedServicesService,
    ),
    LazySingleton(
        classType: ServiceSchedulesServiceLaravel,
        asType: ServiceSchedulesService),
    LazySingleton(
      classType: AppointmentsServiceLaravel,
      asType: AppointmentsService,
    ),
    LazySingleton(
      classType: CompanyServiceLaravel,
      asType: CompanyService,
    ),
    LazySingleton(
      classType: CompanyMembersServiceLaravel,
      asType: CompanyMembersService,
    ),
    Factory(classType: AppViewModel),
    Factory(classType: PillarsViewModel),
    Factory(classType: TasksViewModel),
    Factory(classType: TaskAlarmViewModel),
    Factory(classType: CustomLinksViewModel),
    Factory(classType: ServiceProvidersViewModel),
    Factory(classType: CredentialsViewModel),
    Factory(classType: ServiceSchedulesViewModel),
    Factory(classType: BookAppointmentViewModel),
    Factory(classType: AppointmentViewModel),
    Factory(classType: OfferedServicesViewModel),
    Factory(classType: BadgesViewModel),
    Factory(classType: ChatViewModel),
    Factory(classType: PushNotificationsViewModel),
    Factory(classType: CompaniesViewModel),
    Factory(classType: CompanyMembersViewModel),
    Factory(classType: FieldsViewModel),
    Factory(classType: ClientScaffoldPageViewModel),
    Factory(classType: ClientHomePageViewModel),
    Factory(classType: ServiceProviderScaffoldPageViewModel),
    Factory(classType: ServiceProviderHomePageViewModel),
    Factory(classType: AdminScaffoldPageViewModel),
  ],
)
class AppSetup {}
