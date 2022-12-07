import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pillar_progress.model.freezed.dart';
part 'pillar_progress.model.g.dart';

@freezed
class PillarProgress with _$PillarProgress {
  factory PillarProgress({
    required int id,
    @JsonKey(name: 'color_theme') String? colorTheme,
    @JsonKey(name: 'pillar_icon') String? pillarIcon,
    String? title,
    int? completed,
    int? total,
  }) = _PillarProgress;

  factory PillarProgress.fromJson(Map<String, dynamic> json) =>
      _$PillarProgressFromJson(json);
}
