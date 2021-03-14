import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/teacher.dart';
import 'package:gbuagenda/models/timetable.dart';

abstract class API {
  Future<List<School>> getAllSchools();

  Future<List<Section>> getAllSections(String school);

  Future<Timetable> getTimetable(int section);

  Future<Teacher> getTeacher(int teacherId);

  Future<Subject> getSubject(String code);
}
