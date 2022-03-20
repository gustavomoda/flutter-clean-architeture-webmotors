// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Vehicle _$$_VehicleFromJson(Map<String, dynamic> json) => _$_Vehicle(
      id: json['ID'] as int,
      make: json['Make'] as String,
      model: json['Model'] as String,
      version: json['Version'] as String,
      image: json['Image'] as String,
      km: json['KM'] as int,
      price: json['Price'] as String,
      yearModel: json['YearModel'] as int,
      yearFab: json['YearFab'] as int,
      color: json['Color'] as String,
    );

Map<String, dynamic> _$$_VehicleToJson(_$_Vehicle instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Make': instance.make,
      'Model': instance.model,
      'Version': instance.version,
      'Image': instance.image,
      'KM': instance.km,
      'Price': instance.price,
      'YearModel': instance.yearModel,
      'YearFab': instance.yearFab,
      'Color': instance.color,
    };
