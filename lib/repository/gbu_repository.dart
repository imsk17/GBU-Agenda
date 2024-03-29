import 'package:gbuagenda/db/dao.dart';
import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/teacher.dart';
import 'package:gbuagenda/models/timetable.dart';
import 'package:gbuagenda/network/api.dart';
import 'package:gbuagenda/network/failure.dart';
import 'package:gbuagenda/repository/repository.dart';
import 'package:gbuagenda/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: Repository)
class GBURepository implements Repository {
  final DAO gbuDao;
  final API gbuApi;

  GBURepository(this.gbuDao, this.gbuApi);

  @override
  Future<List<School>> getAllSchools() async {
    final schools = await gbuDao.getAllSchools();
    if (schools.isEmpty) {
      final school = await gbuApi.getAllSchools();
      await Hive.box<School>(Constants.schoolBox).addAll(school);
      return school;
    } else {
      return schools;
    }
  }

  @override
  Future<List<Section>> getAllSections(String school) async {
    List<Section> sections;
    try {
      sections = await gbuApi.getAllSections(school);
    } on Failure {
      sections = await gbuDao.getAllSections(school);
      if (sections.isNotEmpty) {
        await Hive.box<Section>(Constants.sectionBox).addAll(sections);
        return sections;
      }
    }
    return sections;
  }

  @override
  Future<Subject> getSubject(String code) async {
    final subject = await gbuDao.getSubject(code);
    if (subject == null) {
      final sub = await gbuApi.getSubject(code);
      await Hive.box<Subject>(Constants.subjectBox).put(code, sub);
      return sub;
    } else {
      return subject;
    }
  }

  @override
  Future<Teacher> getTeacher(int id) async {
    final teacher = await gbuDao.getTeacher(id);
    if (teacher == null) {
      final teach = await gbuApi.getTeacher(id);
      await Hive.box<Teacher>(Constants.teacherBox).put('$id', teach);
      return teach;
    } else {
      return teacher;
    }
  }

  @override
  Future<Timetable> getTimetable(int section) async {
    try {
      final timetable = await gbuApi.getTimetable(section);
      (await Hive.openBox(Constants.appBox))
          .put(Constants.timeTableFetchKey, DateTime.now().toString());
      (await Hive.openBox<Timetable>(Constants.timetableBox))
          .put('$section', timetable);
      return timetable;
    } on Failure {
      final tt = await gbuDao.getTimetable(section);
      if (tt!.days.isNotEmpty) {
        return tt;
      } else {
        throw Failure(
          "Cant Find Any Data. Check your Internet Connection, Trash!",
        );
      }
    }
  }
}
