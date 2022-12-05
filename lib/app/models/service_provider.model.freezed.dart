// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_provider.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceProvider _$ServiceProviderFromJson(Map<String, dynamic> json) {
  return _ServiceProvider.fromJson(json);
}

/// @nodoc
mixin _$ServiceProvider {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_pic')
  dynamic get profilePic => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  dynamic get birthDate => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_bio')
  dynamic get shortBio => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get verified => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  List<Credential> get credentials => throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;
  @JsonKey(name: 'offered_services')
  List<OfferedService> get offeredServices =>
      throw _privateConstructorUsedError;
  List<ServiceSchedule> get schedules => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceProviderCopyWith<ServiceProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceProviderCopyWith<$Res> {
  factory $ServiceProviderCopyWith(
          ServiceProvider value, $Res Function(ServiceProvider) then) =
      _$ServiceProviderCopyWithImpl<$Res, ServiceProvider>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'profile_pic') dynamic profilePic,
      @JsonKey(name: 'birth_date') dynamic birthDate,
      dynamic gender,
      @JsonKey(name: 'short_bio') dynamic shortBio,
      double rating,
      int verified,
      Address? address,
      List<Credential> credentials,
      List<Review> reviews,
      @JsonKey(name: 'offered_services') List<OfferedService> offeredServices,
      List<ServiceSchedule> schedules});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$ServiceProviderCopyWithImpl<$Res, $Val extends ServiceProvider>
    implements $ServiceProviderCopyWith<$Res> {
  _$ServiceProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? mobileNumber = null,
    Object? profilePic = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? shortBio = null,
    Object? rating = null,
    Object? verified = null,
    Object? address = freezed,
    Object? credentials = null,
    Object? reviews = null,
    Object? offeredServices = null,
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shortBio: null == shortBio
          ? _value.shortBio
          : shortBio // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      credentials: null == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as List<Credential>,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      offeredServices: null == offeredServices
          ? _value.offeredServices
          : offeredServices // ignore: cast_nullable_to_non_nullable
              as List<OfferedService>,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ServiceSchedule>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceProviderCopyWith<$Res>
    implements $ServiceProviderCopyWith<$Res> {
  factory _$$_ServiceProviderCopyWith(
          _$_ServiceProvider value, $Res Function(_$_ServiceProvider) then) =
      __$$_ServiceProviderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      @JsonKey(name: 'mobile_number') String mobileNumber,
      @JsonKey(name: 'profile_pic') dynamic profilePic,
      @JsonKey(name: 'birth_date') dynamic birthDate,
      dynamic gender,
      @JsonKey(name: 'short_bio') dynamic shortBio,
      double rating,
      int verified,
      Address? address,
      List<Credential> credentials,
      List<Review> reviews,
      @JsonKey(name: 'offered_services') List<OfferedService> offeredServices,
      List<ServiceSchedule> schedules});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_ServiceProviderCopyWithImpl<$Res>
    extends _$ServiceProviderCopyWithImpl<$Res, _$_ServiceProvider>
    implements _$$_ServiceProviderCopyWith<$Res> {
  __$$_ServiceProviderCopyWithImpl(
      _$_ServiceProvider _value, $Res Function(_$_ServiceProvider) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? mobileNumber = null,
    Object? profilePic = null,
    Object? birthDate = null,
    Object? gender = null,
    Object? shortBio = null,
    Object? rating = null,
    Object? verified = null,
    Object? address = freezed,
    Object? credentials = null,
    Object? reviews = null,
    Object? offeredServices = null,
    Object? schedules = null,
  }) {
    return _then(_$_ServiceProvider(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shortBio: null == shortBio
          ? _value.shortBio
          : shortBio // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      credentials: null == credentials
          ? _value._credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as List<Credential>,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      offeredServices: null == offeredServices
          ? _value._offeredServices
          : offeredServices // ignore: cast_nullable_to_non_nullable
              as List<OfferedService>,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ServiceSchedule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceProvider implements _ServiceProvider {
  _$_ServiceProvider(
      {required this.id,
      @JsonKey(name: 'first_name')
          required this.firstName,
      @JsonKey(name: 'last_name')
          required this.lastName,
      required this.email,
      @JsonKey(name: 'mobile_number')
          required this.mobileNumber,
      @JsonKey(name: 'profile_pic')
          this.profilePic,
      @JsonKey(name: 'birth_date')
          this.birthDate,
      this.gender,
      @JsonKey(name: 'short_bio')
          this.shortBio,
      this.rating = 0.01,
      this.verified = 0,
      this.address,
      final List<Credential> credentials = const <Credential>[],
      final List<Review> reviews = const <Review>[],
      @JsonKey(name: 'offered_services')
          final List<OfferedService> offeredServices = const <OfferedService>[],
      final List<ServiceSchedule> schedules = const <ServiceSchedule>[]})
      : _credentials = credentials,
        _reviews = reviews,
        _offeredServices = offeredServices,
        _schedules = schedules;

  factory _$_ServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceProviderFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  @JsonKey(name: 'mobile_number')
  final String mobileNumber;
  @override
  @JsonKey(name: 'profile_pic')
  final dynamic profilePic;
  @override
  @JsonKey(name: 'birth_date')
  final dynamic birthDate;
  @override
  final dynamic gender;
  @override
  @JsonKey(name: 'short_bio')
  final dynamic shortBio;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int verified;
  @override
  final Address? address;
  final List<Credential> _credentials;
  @override
  @JsonKey()
  List<Credential> get credentials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_credentials);
  }

  final List<Review> _reviews;
  @override
  @JsonKey()
  List<Review> get reviews {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final List<OfferedService> _offeredServices;
  @override
  @JsonKey(name: 'offered_services')
  List<OfferedService> get offeredServices {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offeredServices);
  }

  final List<ServiceSchedule> _schedules;
  @override
  @JsonKey()
  List<ServiceSchedule> get schedules {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'ServiceProvider(id: $id, firstName: $firstName, lastName: $lastName, email: $email, mobileNumber: $mobileNumber, profilePic: $profilePic, birthDate: $birthDate, gender: $gender, shortBio: $shortBio, rating: $rating, verified: $verified, address: $address, credentials: $credentials, reviews: $reviews, offeredServices: $offeredServices, schedules: $schedules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceProvider &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            const DeepCollectionEquality()
                .equals(other.profilePic, profilePic) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.shortBio, shortBio) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._credentials, _credentials) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality()
                .equals(other._offeredServices, _offeredServices) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      mobileNumber,
      const DeepCollectionEquality().hash(profilePic),
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(shortBio),
      rating,
      verified,
      address,
      const DeepCollectionEquality().hash(_credentials),
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_offeredServices),
      const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceProviderCopyWith<_$_ServiceProvider> get copyWith =>
      __$$_ServiceProviderCopyWithImpl<_$_ServiceProvider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceProviderToJson(
      this,
    );
  }
}

abstract class _ServiceProvider implements ServiceProvider {
  factory _ServiceProvider(
      {required final int id,
      @JsonKey(name: 'first_name')
          required final String firstName,
      @JsonKey(name: 'last_name')
          required final String lastName,
      required final String email,
      @JsonKey(name: 'mobile_number')
          required final String mobileNumber,
      @JsonKey(name: 'profile_pic')
          final dynamic profilePic,
      @JsonKey(name: 'birth_date')
          final dynamic birthDate,
      final dynamic gender,
      @JsonKey(name: 'short_bio')
          final dynamic shortBio,
      final double rating,
      final int verified,
      final Address? address,
      final List<Credential> credentials,
      final List<Review> reviews,
      @JsonKey(name: 'offered_services')
          final List<OfferedService> offeredServices,
      final List<ServiceSchedule> schedules}) = _$_ServiceProvider;

  factory _ServiceProvider.fromJson(Map<String, dynamic> json) =
      _$_ServiceProvider.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get email;
  @override
  @JsonKey(name: 'mobile_number')
  String get mobileNumber;
  @override
  @JsonKey(name: 'profile_pic')
  dynamic get profilePic;
  @override
  @JsonKey(name: 'birth_date')
  dynamic get birthDate;
  @override
  dynamic get gender;
  @override
  @JsonKey(name: 'short_bio')
  dynamic get shortBio;
  @override
  double get rating;
  @override
  int get verified;
  @override
  Address? get address;
  @override
  List<Credential> get credentials;
  @override
  List<Review> get reviews;
  @override
  @JsonKey(name: 'offered_services')
  List<OfferedService> get offeredServices;
  @override
  List<ServiceSchedule> get schedules;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceProviderCopyWith<_$_ServiceProvider> get copyWith =>
      throw _privateConstructorUsedError;
}
