import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/teacher.dart';
import 'package:GbuAgenda/models/timetable.dart';
import 'package:GbuAgenda/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import 'dao.dart';

@LazySingleton(as: DAO)
class GBUDao implements DAO {
  @override
  Future<List<School>> getAllSchools() async {
    if (Hive.isBoxOpen(Constants.schoolBox)) {
      return Hive.box<School>(Constants.schoolBox).values.toList();
    } else {
      return (await Hive.openBox<School>(Constants.schoolBox)).values.toList();
    }
  }

  @override
  Future<List<Section>> getAllSections(String school) async {
    if (Hive.isBoxOpen(Constants.sectionBox)) {
      return Hive.box<Section>(Constants.sectionBox)
          .values
          .where((element) => element.school == school)
          .toList();
    } else {
      return (await Hive.openBox<Section>(Constants.sectionBox))
          .values
          .where((element) => element.school == school)
          .toList();
    }
  }

  @override
  Future<Timetable> getTimetable(int section) async {
    if (Hive.isBoxOpen(Constants.timetableBox)) {
      return Hive.box<Timetable>(Constants.timetableBox).get('$section');
    } else {
      return (await Hive.openBox<Timetable>(Constants.timetableBox))
          .get('$section');
    }
  }

  @override
  Future<Subject> getSubject(String code) async {
    if (Hive.isBoxOpen(Constants.subjectBox)) {
      return Hive.box<Subject>(Constants.subjectBox).get(code);
    } else {
      return (await Hive.openBox<Subject>(Constants.subjectBox)).get(code);
    }
  }

  @override
  Future<Teacher> getTeacher(int id) async {
    if (Hive.isBoxOpen(Constants.teacherBox)) {
      return Hive.box<Teacher>(Constants.teacherBox).get('$id');
    } else {
      return (await Hive.openBox<Teacher>(Constants.teacherBox)).get('$id');
    }
  }
}
