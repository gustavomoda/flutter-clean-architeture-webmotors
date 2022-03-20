// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i3;

import 'features/vehicles/domain/services/vehicles.dart' as _i5;
import 'features/vehicles/domain/usecases/get_veichiles.dart' as _i6;
import 'features/vehicles/presentation/controller/vehicles.dart' as _i7;
import 'injector.dart' as _i8;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.Logger>(registerModule.loggerProd(),
      registerFor: {_prod, _dev});
  gh.singleton<_i3.Logger>(registerModule.loggerTest(), registerFor: {_test});
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.singleton<_i4.Dio>(
      registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i5.VehicleService>(() => _i5.VehicleService(get<_i4.Dio>()));
  gh.factory<_i6.GetVehicles>(
      () => _i6.GetVehicles(get<_i5.VehicleService>(), get<_i3.Logger>()));
  gh.factory<_i7.VehiclesController>(
      () => _i7.VehiclesController(get<_i6.GetVehicles>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
