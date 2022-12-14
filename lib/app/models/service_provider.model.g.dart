// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServiceProvider _$$_ServiceProviderFromJson(Map<String, dynamic> json) =>
    _$_ServiceProvider(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      profilePic: json['profile_pic'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      shortBio: json['short_bio'],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.01,
      verified: json['verified'] as int? ?? 0,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      credentials: (json['credentials'] as List<dynamic>?)
              ?.map((e) => Credential.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Credential>[],
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Review>[],
      offeredServices: (json['offered_services'] as List<dynamic>?)
              ?.map((e) => OfferedService.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OfferedService>[],
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map((e) => ServiceSchedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ServiceSchedule>[],
    );

Map<String, dynamic> _$$_ServiceProviderToJson(_$_ServiceProvider instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile_number': instance.mobileNumber,
      'profile_pic': instance.profilePic,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'short_bio': instance.shortBio,
      'rating': instance.rating,
      'verified': instance.verified,
      'address': instance.address,
      'credentials': instance.credentials,
      'reviews': instance.reviews,
      'offered_services': instance.offeredServices,
      'schedules': instance.schedules,
    };
