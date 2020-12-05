import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/teacher.dart';
import 'package:GbuAgenda/models/timetable.dart';

abstract class Repository {
  Future<List<School>> getAllSchools();

  Future<List<Section>> getAllSections(String school);

  Future<Timetable> getTimetable(int section);

  Future<Subject> getSubject(String code);

  Future<Teacher> getTeacher(int id);
}
