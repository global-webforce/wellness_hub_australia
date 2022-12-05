// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentStatus _$$_PaymentStatusFromJson(Map<String, dynamic> json) =>
    _$_PaymentStatus(
      type: json['type'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      paymentDate: json['payment_date'],
      refundDate: json['refund_date'],
    );

Map<String, dynamic> _$$_PaymentStatusToJson(_$_PaymentStatus instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'payment_date': instance.paymentDate,
      'refund_date': instance.refundDate,
    };
