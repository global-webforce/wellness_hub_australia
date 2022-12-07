import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_link.model.freezed.dart';
part 'custom_link.model.g.dart';

@freezed
class CustomLink with _$CustomLink {
  factory CustomLink({
    int? id,
    @JsonKey(name: 'link_icon') String? linkIcon,
    @JsonKey(name: 'company_name') String? companyName,
    String? title,
    String? description,
    String? url,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CustomLink;

  factory CustomLink.fromJson(Map<String, dynamic> json) =>
      _$CustomLinkFromJson(json);
}
