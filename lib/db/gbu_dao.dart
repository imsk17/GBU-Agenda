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
    if (Hive.isBoxOpen(Constants.SchoolBox)) {
      return Hive.box<School>(Constants.SchoolBox).values.toList();
    } else {
      return (await Hive.openBox<School>(Constants.SchoolBox)).values.toList();
    }
  }

  @override
  Future<List<Section>> getAllSections(String school) async {
    if (Hive.isBoxOpen(Constants.SectionBox)) {
      return Hive.box<Section>(Constants.SectionBox)
          .values
          .where((element) => element.school == school)
          .toList();
    } else {
      return (await Hive.openBox<Section>(Constants.SectionBox))
          .values
          .where((element) => element.school == school)
          .toList();
    }
  }

  @override
  Future<Timetable> getTimetable(int section) async {
    if (Hive.isBoxOpen(Constants.TimetableBox)) {
      return Hive.box<Timetable>(Constants.TimetableBox).get('$section');
    } else {
      return (await Hive.openBox<Timetable>(Constants.TimetableBox))
          .get('$section');
    }
  }

  @override
  Future<Subject> getSubject(String code) async {
    if (Hive.isBoxOpen(Constants.SubjectBox)) {
      return Hive.box<Subject>(Constants.SubjectBox).get(code);
    } else {
      return (await Hive.openBox<Subject>(Constants.SubjectBox)).get(code);
    }
  }

  @override
  Future<Teacher> getTeacher(int id) async {
    if (Hive.isBoxOpen(Constants.TeacherBox)) {
      return Hive.box<Teacher>(Constants.TeacherBox).get('$id');
    } else {
      return (await Hive.openBox<Teacher>(Constants.TeacherBox)).get('$id');
    }
  }
}
