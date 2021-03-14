import 'dart:io';

import 'package:gbuagenda/models/school.dart';
import 'package:gbuagenda/models/section.dart';
import 'package:gbuagenda/models/subject.dart';
import 'package:gbuagenda/models/teacher.dart';
import 'package:gbuagenda/models/timetable.dart';
import 'package:gbuagenda/network/api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'failure.dart';

@LazySingleton(as: API)
class GBUAgendaAPI implements API {
  final Dio _dioClient;

  GBUAgendaAPI(this._dioClient);

  @override
  Future<List<School>> getAllSchools() async {
    final schools = <School>[];
    try {
      final response = await _dioClient.get('schools');
      for (final item in response.data) {
        final school = School.fromJson(item as Map<String, dynamic>);
        schools.add(school);
      }
    } on SocketException {
      throw Failure('Do You Even Have Internet, Lowlife?');
    } on FormatException {
      throw Failure('My Server is Trash (just like you). Try Later!');
    } on DioError {
      throw Failure(
        'What a Trashy Internet Connection, Commit Suicide Already Man!',
      );
    }
    return schools;
  }

  @override
  Future<List<Section>> getAllSections(String school) async {
    final sections = <Section>[];
    try {
      final response = await _dioClient.get('/sections?school=$school');
      for (final item in response.data) {
        final section = Section.fromJson(item as Map<String, dynamic>);
        sections.add(section);
      }
    } on SocketException {
      throw Failure('Do You Even Have Internet, Lowlife?');
    } on FormatException {
      throw Failure('My Server is Trash (just like you). Try Later!');
    } on DioError {
      throw Failure(
        'What a Trashy Internet Connection, Commit Suicide Already Man!',
      );
    }
    return sections;
  }

  @override
  Future<Subject> getSubject(String code) async {
    Subject subject;
    try {
      final response = await _dioClient.get('/subjects?subject=$code');
      subject = Subject.fromJson(response.data as Map<String, dynamic>);
    } on SocketException {
      throw Failure('Do You Even Have Internet, Lowlife?');
    } on FormatException {
      throw Failure('My Server is Trash (just like you). Try Later!');
    } on DioError {
      throw Failure(
        'What a Trashy Internet Connection, Commit Suicide Already Man!',
      );
    }
    return subject;
  }

  @override
  Future<Teacher> getTeacher(int teacherId) async {
    Teacher teacher;
    try {
      final response = await _dioClient.get('/teachers?teacher_id=$teacherId');
      teacher = Teacher.fromJson(response.data as Map<String, dynamic>);
    } on SocketException {
      throw Failure('Do You Even Have Internet, Lowlife?');
    } on FormatException {
      throw Failure('My Server is Trash (just like you). Try Later!');
    } on DioError {
      throw Failure(
        'What a Trashy Internet Connection, Commit Suicide Already Man!',
      );
    }
    return teacher;
  }

  @override
  Future<Timetable> getTimetable(int section) async {
    Timetable timetable;
    try {
      final response = await _dioClient.get('/timetable?section=$section');
      timetable = Timetable.fromJson(response.data as Map<String, dynamic>);
    } on SocketException {
      throw Failure('Do You Even Have Internet, Lowlife?');
    } on FormatException {
      throw Failure('My Server is Trash (just like you). Try Later!');
    } on DioError {
      throw Failure(
        'What a Trashy Internet Connection, Commit Suicide Already Man!',
      );
    }
    return timetable;
  }
}
