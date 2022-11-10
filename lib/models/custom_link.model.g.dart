// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_link.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomLink _$$_CustomLinkFromJson(Map<String, dynamic> json) =>
    _$_CustomLink(
      id: json['id'] as int?,
      linkIcon: json['link_icon'] as String?,
      companyName: json['company_name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_CustomLinkToJson(_$_CustomLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link_icon': instance.linkIcon,
      'company_name': instance.companyName,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
