import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app_service.dart';

class ApiEndpoints {
  final _appService = locator<AppService>();
  static final ApiEndpoints _instance = ApiEndpoints._();
  ApiEndpoints._();
  static ApiEndpoints get instance {
    return _instance;
  }

  static const String baseUrl = "https://app.wellnesshubaustralia.com/api";
  String pillarsProgressEndpoint() =>
      "$baseUrl/progress/${_appService.user?.id}";

  static const String pillars = "$baseUrl/pillars-API";
  static const String customLinks = "$baseUrl/custom-links";

  static const String createAppointment = "$baseUrl/create-appointment";
  String updateAppointment(int? appointmentId) =>
      "$baseUrl/update-appointment/$appointmentId";
  String clientAppointment() =>
      "$baseUrl/member/${_appService.user?.id}/get-appointment";
  String serviceProviderAppointment() =>
      "$baseUrl/service-provider/${_appService.user?.id}/get-appointment";

  String badges() => "$baseUrl/badges/${_appService.user?.id}";

  String messages() =>
      "$baseUrl/user/${_appService.user?.id}/messages/get-threads";
  String messageThread(int? threadId) =>
      "$baseUrl/user/${_appService.user?.id}/messages/$threadId";
  String messageSend(int? threadId) =>
      "$baseUrl/send-message/${_appService.user?.id}/$threadId";

  String companies() => "$baseUrl/custom-links";
  static const String companyMembers = "$baseUrl/custom-links";

  String addCredential() =>
      "$baseUrl/service-provider/credential/add/${_appService.user?.id}";

  String credentials() =>
      "$baseUrl/service-provider/${_appService.user?.id}/credentials";

  String deleteCredential(int? id) =>
      "$baseUrl/service-provider/credential/remove/$id";

  static const String fields = "$baseUrl/fields";

  String services() =>
      "$baseUrl/service-provider/${_appService.user?.id}/fields";
  String addService() =>
      "$baseUrl/service-provider/field/assign/${_appService.user?.id}";
  String deleteService(int? id) => "$baseUrl/service-provider/field/remove/$id";

  String notifications() => "$baseUrl/notifications/${_appService.user?.id}";
  String notificationDelete(int? id) => "$baseUrl/notifications/$id";

  static const String serviceProviders = "$baseUrl/service-providers";
  String serviceProvider() =>
      "$baseUrl/service-providers/${_appService.user?.id}";

  String addSchedule() =>
      "$baseUrl/service-provider/schedule/add/${_appService.user?.id}";
  String updateSchedule() =>
      "$baseUrl/service-provider/schedule/add/${_appService.user?.id}";
  String deleteSchedule(int? id) =>
      "$baseUrl/service-provider/schedule/remove/$id";
  String schedules() =>
      "$baseUrl/service-provider/${_appService.user?.id}/schedules";

  String tasks() => "$baseUrl/tasks/${_appService.user?.id}";
  String undoFinishedTask(int? id) => "$baseUrl/taskprogress/$id";
  String finishTask() => "$baseUrl/taskprogress";

  String addAlarm() => "$baseUrl/alarm";
  String updateAlarm(int? id) => "$baseUrl/alarm/$id";
  String deleteAlarm(int? id) => "$baseUrl/alarm/$id";

  static const Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': 'my_url'
  };
}
