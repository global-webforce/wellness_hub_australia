import 'package:freezed_annotation/freezed_annotation.dart';

part 'offered_service.model.freezed.dart';
part 'offered_service.model.g.dart';

@freezed
class OfferedService with _$OfferedService {
  factory OfferedService({
    int? id,
    @JsonKey(name: 'pillar_id') int? pillarId,
    String? title,
    String? description,
    @JsonKey(name: 'service_provider_id') int? serviceProviderId,
    @JsonKey(name: 'field_id') int? fieldId,
    @JsonKey(name: 'rate_per_hour') double? ratePerHour,
    int? verified,
  }) = _OfferedService;

  factory OfferedService.fromJson(Map<String, dynamic> json) =>
      _$OfferedServiceFromJson(json);
}
