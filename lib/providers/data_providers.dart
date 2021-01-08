import 'package:GbuAgenda/di/locator.dart';

import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/timetable.dart';
import 'package:GbuAgenda/repository/repository.dart';
import 'package:flutter_riverpod/all.dart';

class DataProviders {
  static final school =
      FutureProvider((ref) async => getIt<Repository>().getAllSchools());
  static final section =
      FutureProvider.family<List<Section>, String>((_, school) async {
    return getIt<Repository>().getAllSections(school);
  });
  static final timeTable =
      FutureProvider.family<Timetable, int>((_, section) async {
    return getIt<Repository>().getTimetable(section);
  });
  static final subject =
      FutureProvider.family<Subject, String>((_, code) async {
    return getIt<Repository>().getSubject(code);
  });
}
