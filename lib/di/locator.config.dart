// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:gbuagenda/network/api.dart';
import 'package:gbuagenda/db/dao.dart';
import 'package:dio/dio.dart';
import 'package:gbuagenda/di/locator.dart';
import 'package:gbuagenda/network/gbu_agenda_api.dart';
import 'package:gbuagenda/db/gbu_dao.dart';
import 'package:gbuagenda/repository/gbu_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:gbuagenda/repository/repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.lazySingleton<DAO>(() => GBUDao());
  gh.lazySingleton<String>(() => dioModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<Dio>(
      () => dioModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<API>(() => GBUAgendaAPI(get<Dio>()));
  gh.lazySingleton<Repository>(() => GBURepository(get<DAO>(), get<API>()));
  return get;
}

class _$DioModule extends DioModule {}
