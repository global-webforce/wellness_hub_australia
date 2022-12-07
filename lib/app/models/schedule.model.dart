import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.model.freezed.dart';
part 'schedule.model.g.dart';

@freezed
class Schedule with _$Schedule {
  factory Schedule({
    int? id,
    @JsonKey(name: 'task_id') int? taskId,
    String? weekdays,
    String? timeSlots,
    @Default(0) int enabled,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
