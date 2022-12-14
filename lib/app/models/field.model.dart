import 'package:freezed_annotation/freezed_annotation.dart';

part 'field.model.freezed.dart';
part 'field.model.g.dart';

@freezed
class Field with _$Field {
  factory Field({
    int? id,
    @JsonKey(name: 'pillar_id') int? pillarId,
    String? title,
    dynamic icon,
    String? description,
  }) = _Field;

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
}
