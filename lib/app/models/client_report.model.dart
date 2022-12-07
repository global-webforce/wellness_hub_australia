import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_report.model.freezed.dart';
part 'client_report.model.g.dart';

@freezed
class ClientReport with _$ClientReport {
  factory ClientReport({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    dynamic mobile,
    dynamic company,
    @JsonKey(name: 'overall_progress') String? overallProgress,
  }) = _ClientReport;

  factory ClientReport.fromJson(Map<String, dynamic> json) =>
      _$ClientReportFromJson(json);
}
