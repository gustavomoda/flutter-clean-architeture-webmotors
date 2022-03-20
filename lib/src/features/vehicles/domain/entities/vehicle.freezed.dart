// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
class _$VehicleTearOff {
  const _$VehicleTearOff();

  _Vehicle call(
      {@JsonKey(name: 'ID') required int id,
      @JsonKey(name: 'Make') required String make,
      @JsonKey(name: 'Model') required String model,
      @JsonKey(name: 'Version') required String version,
      @JsonKey(name: 'Image') required String image,
      @JsonKey(name: 'KM') required int km,
      @JsonKey(name: 'Price') required String price,
      @JsonKey(name: 'YearModel') required int yearModel,
      @JsonKey(name: 'YearFab') required int yearFab,
      @JsonKey(name: 'Color') required String color}) {
    return _Vehicle(
      id: id,
      make: make,
      model: model,
      version: version,
      image: image,
      km: km,
      price: price,
      yearModel: yearModel,
      yearFab: yearFab,
      color: color,
    );
  }

  Vehicle fromJson(Map<String, Object?> json) {
    return Vehicle.fromJson(json);
  }
}

/// @nodoc
const $Vehicle = _$VehicleTearOff();

/// @nodoc
mixin _$Vehicle {
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Make')
  String get make => throw _privateConstructorUsedError;
  @JsonKey(name: 'Model')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'Version')
  String get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'Image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'KM')
  int get km => throw _privateConstructorUsedError;
  @JsonKey(name: 'Price')
  String get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'YearModel')
  int get yearModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'YearFab')
  int get yearFab => throw _privateConstructorUsedError;
  @JsonKey(name: 'Color')
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Make') String make,
      @JsonKey(name: 'Model') String model,
      @JsonKey(name: 'Version') String version,
      @JsonKey(name: 'Image') String image,
      @JsonKey(name: 'KM') int km,
      @JsonKey(name: 'Price') String price,
      @JsonKey(name: 'YearModel') int yearModel,
      @JsonKey(name: 'YearFab') int yearFab,
      @JsonKey(name: 'Color') String color});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res> implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  final Vehicle _value;
  // ignore: unused_field
  final $Res Function(Vehicle) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? make = freezed,
    Object? model = freezed,
    Object? version = freezed,
    Object? image = freezed,
    Object? km = freezed,
    Object? price = freezed,
    Object? yearModel = freezed,
    Object? yearFab = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      make: make == freezed
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      km: km == freezed
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      yearModel: yearModel == freezed
          ? _value.yearModel
          : yearModel // ignore: cast_nullable_to_non_nullable
              as int,
      yearFab: yearFab == freezed
          ? _value.yearFab
          : yearFab // ignore: cast_nullable_to_non_nullable
              as int,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$VehicleCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$VehicleCopyWith(_Vehicle value, $Res Function(_Vehicle) then) =
      __$VehicleCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'ID') int id,
      @JsonKey(name: 'Make') String make,
      @JsonKey(name: 'Model') String model,
      @JsonKey(name: 'Version') String version,
      @JsonKey(name: 'Image') String image,
      @JsonKey(name: 'KM') int km,
      @JsonKey(name: 'Price') String price,
      @JsonKey(name: 'YearModel') int yearModel,
      @JsonKey(name: 'YearFab') int yearFab,
      @JsonKey(name: 'Color') String color});
}

/// @nodoc
class __$VehicleCopyWithImpl<$Res> extends _$VehicleCopyWithImpl<$Res>
    implements _$VehicleCopyWith<$Res> {
  __$VehicleCopyWithImpl(_Vehicle _value, $Res Function(_Vehicle) _then)
      : super(_value, (v) => _then(v as _Vehicle));

  @override
  _Vehicle get _value => super._value as _Vehicle;

  @override
  $Res call({
    Object? id = freezed,
    Object? make = freezed,
    Object? model = freezed,
    Object? version = freezed,
    Object? image = freezed,
    Object? km = freezed,
    Object? price = freezed,
    Object? yearModel = freezed,
    Object? yearFab = freezed,
    Object? color = freezed,
  }) {
    return _then(_Vehicle(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      make: make == freezed
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      km: km == freezed
          ? _value.km
          : km // ignore: cast_nullable_to_non_nullable
              as int,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      yearModel: yearModel == freezed
          ? _value.yearModel
          : yearModel // ignore: cast_nullable_to_non_nullable
              as int,
      yearFab: yearFab == freezed
          ? _value.yearFab
          : yearFab // ignore: cast_nullable_to_non_nullable
              as int,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vehicle implements _Vehicle {
  const _$_Vehicle(
      {@JsonKey(name: 'ID') required this.id,
      @JsonKey(name: 'Make') required this.make,
      @JsonKey(name: 'Model') required this.model,
      @JsonKey(name: 'Version') required this.version,
      @JsonKey(name: 'Image') required this.image,
      @JsonKey(name: 'KM') required this.km,
      @JsonKey(name: 'Price') required this.price,
      @JsonKey(name: 'YearModel') required this.yearModel,
      @JsonKey(name: 'YearFab') required this.yearFab,
      @JsonKey(name: 'Color') required this.color});

  factory _$_Vehicle.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final int id;
  @override
  @JsonKey(name: 'Make')
  final String make;
  @override
  @JsonKey(name: 'Model')
  final String model;
  @override
  @JsonKey(name: 'Version')
  final String version;
  @override
  @JsonKey(name: 'Image')
  final String image;
  @override
  @JsonKey(name: 'KM')
  final int km;
  @override
  @JsonKey(name: 'Price')
  final String price;
  @override
  @JsonKey(name: 'YearModel')
  final int yearModel;
  @override
  @JsonKey(name: 'YearFab')
  final int yearFab;
  @override
  @JsonKey(name: 'Color')
  final String color;

  @override
  String toString() {
    return 'Vehicle(id: $id, make: $make, model: $model, version: $version, image: $image, km: $km, price: $price, yearModel: $yearModel, yearFab: $yearFab, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Vehicle &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.make, make) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.km, km) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.yearModel, yearModel) &&
            const DeepCollectionEquality().equals(other.yearFab, yearFab) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(make),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(km),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(yearModel),
      const DeepCollectionEquality().hash(yearFab),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$VehicleCopyWith<_Vehicle> get copyWith =>
      __$VehicleCopyWithImpl<_Vehicle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleToJson(this);
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle(
      {@JsonKey(name: 'ID') required int id,
      @JsonKey(name: 'Make') required String make,
      @JsonKey(name: 'Model') required String model,
      @JsonKey(name: 'Version') required String version,
      @JsonKey(name: 'Image') required String image,
      @JsonKey(name: 'KM') required int km,
      @JsonKey(name: 'Price') required String price,
      @JsonKey(name: 'YearModel') required int yearModel,
      @JsonKey(name: 'YearFab') required int yearFab,
      @JsonKey(name: 'Color') required String color}) = _$_Vehicle;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$_Vehicle.fromJson;

  @override
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(name: 'Make')
  String get make;
  @override
  @JsonKey(name: 'Model')
  String get model;
  @override
  @JsonKey(name: 'Version')
  String get version;
  @override
  @JsonKey(name: 'Image')
  String get image;
  @override
  @JsonKey(name: 'KM')
  int get km;
  @override
  @JsonKey(name: 'Price')
  String get price;
  @override
  @JsonKey(name: 'YearModel')
  int get yearModel;
  @override
  @JsonKey(name: 'YearFab')
  int get yearFab;
  @override
  @JsonKey(name: 'Color')
  String get color;
  @override
  @JsonKey(ignore: true)
  _$VehicleCopyWith<_Vehicle> get copyWith =>
      throw _privateConstructorUsedError;
}
