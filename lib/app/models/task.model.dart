import 'package:freezed_annotation/freezed_annotation.dart';

import 'schedule.model.dart';

part 'task.model.freezed.dart';
part 'task.model.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    int? id,
    String? title,
    String? description,
    @JsonKey(name: 'pillar_id') int? pillarId,
    @JsonKey(name: 'embed_url') String? embedUrl,
    String? frequency,
    @JsonKey(name: 'imgURL') String? imgUrl,
    @JsonKey(name: 'task_progress_id') int? taskProgressId,
    bool? isFavorite,
    Schedule? schedule,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
