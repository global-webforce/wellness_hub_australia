import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge.model.freezed.dart';
part 'badge.model.g.dart';

@freezed
class Badge with _$Badge {
  factory Badge({
    int? id,
    @JsonKey(name: 'badge_name') String? badgeName,
    String? description,
    @JsonKey(name: 'img_path') String? imgPath,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(false) bool acquired,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}
