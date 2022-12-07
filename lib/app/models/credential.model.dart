import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.model.freezed.dart';
part 'credential.model.g.dart';

@freezed
class Credential with _$Credential {
  factory Credential({
    int? id,
    @JsonKey(name: 'service_provider_id') int? serviceProviderId,
    String? title,
    String? description,
    int? verified,
    @JsonKey(name: 'date_issued') dynamic dateIssued,
    String? attachment,
  }) = _Credential;

  factory Credential.fromJson(Map<String, dynamic> json) =>
      _$CredentialFromJson(json);
}
