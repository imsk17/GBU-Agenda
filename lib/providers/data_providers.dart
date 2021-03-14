import 'package:GbuAgenda/di/locator.dart';

import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/timetable.dart';
import 'package:GbuAgenda/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataProviders {
  static final Repository _repo = getIt<Repository>();
  static final school = FutureProvider(
    (ref) async => _repo.getAllSchools(),
  );
  static final section = FutureProvider.family<List<Section>, String>(
    (_, school) async {
      return _repo.getAllSections(school);
    },
  );
  static final timeTable = FutureProvider.family<Timetable, int>(
    (_, section) async {
      return _repo.getTimetable(section);
    },
  );
  static final subject = FutureProvider.family<Subject, String>(
    (_, code) async {
      return _repo.getSubject(code);
    },
  );
}
