import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pillar.model.freezed.dart';
part 'pillar.model.g.dart';

@freezed
class Pillar with _$Pillar {
  factory Pillar({
    int? id,
    String? title,
    @JsonKey(name: 'color_theme') String? colorTheme,
    @JsonKey(name: 'pillar_icon') String? pillarIcon,
    String? description,
  }) = _Pillar;

  factory Pillar.fromJson(Map<String, dynamic> json) => _$PillarFromJson(json);
}
