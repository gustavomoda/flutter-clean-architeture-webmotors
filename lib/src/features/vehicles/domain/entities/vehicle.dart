import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'Make') required String make,
    @JsonKey(name: 'Model') required String model,
    @JsonKey(name: 'Version') required String version,
    @JsonKey(name: 'Image') required String image,
    @JsonKey(name: 'KM') required int km,
    @JsonKey(name: 'Price') required String price,
    @JsonKey(name: 'YearModel') required int yearModel,
    @JsonKey(name: 'YearFab') required int yearFab,
    @JsonKey(name: 'Color') required String color,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, Object?> json) => _$VehicleFromJson(json);
}
