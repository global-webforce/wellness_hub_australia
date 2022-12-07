import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_schedule.model.freezed.dart';
part 'service_schedule.model.g.dart';

@freezed
class ServiceSchedule with _$ServiceSchedule {
  factory ServiceSchedule({
    int? id,
    String? day,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    String? status,
  }) = _ServiceSchedule;

  factory ServiceSchedule.fromJson(Map<String, dynamic> json) =>
      _$ServiceScheduleFromJson(json);
}
