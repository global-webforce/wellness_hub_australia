// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as int?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.01,
      serviceProviderId: json['service_provider_id'] as int?,
      comment: json['comment'] as String?,
      author: json['author'] as String?,
      authorPic: json['author_pic'] as String?,
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'service_provider_id': instance.serviceProviderId,
      'comment': instance.comment,
      'author': instance.author,
      'author_pic': instance.authorPic,
    };
