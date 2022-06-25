// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:gbuagenda/db/dao.dart' as _i3;
import 'package:gbuagenda/db/gbu_dao.dart' as _i4;
import 'package:gbuagenda/di/locator.dart' as _i10;
import 'package:gbuagenda/network/api.dart' as _i6;
import 'package:gbuagenda/network/gbu_agenda_api.dart' as _i7;
import 'package:gbuagenda/repository/gbu_repository.dart' as _i9;
import 'package:gbuagenda/repository/repository.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.lazySingleton<_i3.DAO>(() => _i4.GBUDao());
  gh.lazySingleton<String>(() => dioModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i5.Dio>(
    () => dioModule.dio(get<String>(instanceName: 'BaseUrl')),
  );
  gh.lazySingleton<_i6.API>(() => _i7.GBUAgendaAPI(get<_i5.Dio>()));
  gh.lazySingleton<_i8.Repository>(
    () => _i9.GBURepository(get<_i3.DAO>(), get<_i6.API>()),
  );
  return get;
}

class _$DioModule extends _i10.DioModule {}
