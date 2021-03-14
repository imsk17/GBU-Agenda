import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/teacher.dart';
import 'package:gbuagenda/models/timetable.dart';

abstract class Repository {
  Future<List<School>> getAllSchools();

  Future<List<Section>> getAllSections(String school);

  Future<Timetable> getTimetable(int section);

  Future<Subject> getSubject(String code);

  Future<Teacher> getTeacher(int id);
}
