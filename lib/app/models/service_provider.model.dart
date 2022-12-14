import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.model.dart';
import 'credential.model.dart';
import 'offered_service.model.dart';
import 'review.model.dart';
import 'service_schedule.model.dart';

part 'service_provider.model.freezed.dart';
part 'service_provider.model.g.dart';

@freezed
class ServiceProvider with _$ServiceProvider {
  factory ServiceProvider({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    @JsonKey(name: 'profile_pic') dynamic profilePic,
    @JsonKey(name: 'birth_date') dynamic birthDate,
    dynamic gender,
    @JsonKey(name: 'short_bio') dynamic shortBio,
    @Default(0.01) double rating,
    @Default(0) int verified,
    Address? address,
    @Default(<Credential>[]) List<Credential> credentials,
    @Default(<Review>[]) List<Review> reviews,
    @JsonKey(name: 'offered_services')
    @Default(<OfferedService>[])
        List<OfferedService> offeredServices,
    @Default(<ServiceSchedule>[]) List<ServiceSchedule> schedules,
  }) = _ServiceProvider;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderFromJson(json);
}
