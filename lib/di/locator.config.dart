// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:GbuAgenda/network/api.dart';
import 'package:GbuAgenda/db/dao.dart';
import 'package:dio/dio.dart';
import 'package:GbuAgenda/di/locator.dart';
import 'package:GbuAgenda/network/gbu_agenda_api.dart';
import 'package:GbuAgenda/db/gbu_dao.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

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
  return get;
}

class _$DioModule extends DioModule {}
