import 'package:freezed_annotation/freezed_annotation.dart';

import 'client.model.dart';

part 'company.model.freezed.dart';
part 'company.model.g.dart';

@freezed
class Company with _$Company {
  factory Company({
    int? id,
    String? name,
    String? description,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(<Client>[]) List<Client> members,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
