import 'package:gbuagenda/di/locator.dart';

import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/timetable.dart';
import 'package:gbuagenda/repository/repository.dart';
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
