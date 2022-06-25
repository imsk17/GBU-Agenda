import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gbuagenda/di/locator.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/timetable.dart';
import 'package:gbuagenda/repository/repository.dart';

class DataProviders {
  static final Repository _repo = getIt<Repository>();
  static final school = FutureProvider(
    (ref) async => _repo.getAllSchools(),
  );
  static final FutureProviderFamily<List<Section>, String> section =
      FutureProvider.family<List<Section>, String>(
    (_, school) async {
      return _repo.getAllSections(school);
    },
  );
  static final FutureProviderFamily<Timetable, int> timeTable =
      FutureProvider.family<Timetable, int>(
    (_, section) async {
      return _repo.getTimetable(section);
    },
  );
  static final FutureProviderFamily<Subject, String> subject =
      FutureProvider.family<Subject, String>(
    (_, code) async {
      return _repo.getSubject(code);
    },
  );
}
