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
      return (await Hive.openBox(Constants.SchoolBox)).values.toList();
    }
  }

  @override
  Future<List<Section>> getAllSections(String school) async {
    if (Hive.isBoxOpen(Constants.SchoolBox)) {
      return Hive.box<Section>(Constants.SectionBox).values.toList();
    } else {
      return (await Hive.openBox<Section>(Constants.SectionBox))
          .values
          .toList();
    }
  }

  @override
  Future<Timetable> getTimetable(int section) async {
    if (Hive.isBoxOpen(Constants.TimetableBox)) {
      return Hive.box<Timetable>(Constants.TimetableBox).values.last;
    } else {
      return (await Hive.openBox<Timetable>(Constants.TimetableBox))
          .values
          .last;
    }
  }

  @override
  Future<Subject> getSubject(String code) async {
    if (Hive.isBoxOpen(Constants.SubjectBox)) {
      return Hive.box<Subject>(Constants.SubjectBox)
          .values
          .where((element) => element.subCode == code)
          .first;
    } else {
      return (await Hive.openBox<Subject>(Constants.SubjectBox))
          .values
          .where((element) => element.subCode == code)
          .first;
    }
  }

  @override
  Future<Teacher> getTeacher(int id) async {
    if (Hive.isBoxOpen(Constants.TeacherBox)) {
      return Hive.box<Teacher>(Constants.TeacherBox)
          .values
          .where((element) => element.id == id)
          .first;
    } else {
      return (await Hive.openBox<Teacher>(Constants.TeacherBox))
          .values
          .where((element) => element.id == id)
          .first;
    }
  }
}
