import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/teacher.dart';
import 'package:GbuAgenda/models/timetable.dart';

abstract class API {
  Future<List<School>> getAllSchools();

  Future<List<Section>> getAllSections(String school);

  Future<Timetable> getTimetable(int section);

  Future<Teacher> getTeacher(int teacherId);

  Future<Subject> getSubject(String code);
}
