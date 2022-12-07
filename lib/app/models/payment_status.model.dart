import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_status.model.freezed.dart';
part 'payment_status.model.g.dart';

@freezed
class PaymentStatus with _$PaymentStatus {
  factory PaymentStatus({
    String? type,
    double? amount,
    @JsonKey(name: 'payment_date') dynamic paymentDate,
    @JsonKey(name: 'refund_date') dynamic refundDate,
  }) = _PaymentStatus;

  factory PaymentStatus.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusFromJson(json);
}
