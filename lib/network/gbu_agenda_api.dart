import 'dart:io';

import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/teacher.dart';
import 'package:GbuAgenda/models/timetable.dart';
import 'package:GbuAgenda/network/api.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';

import 'failure.dart';

class GBUAgendaAPI implements API {
  final Dio _dioClient;

  GBUAgendaAPI(this._dioClient);

  @override
  Future<List<School>> getAllSchools() async {
    var schools = <School>[];
    try {
      var response = await _dioClient.get('schools');
      for (final item in response.data) {
        var school = School.fromJson(item);
        schools.add(school);
      }
    } on SocketException {
      throw Failure('Your internet is trash.');
    } on FormatException {
      throw Failure('My Server is crazy. Please retry later.');
    } on HttpException {
      throw Failure('Bruh Moment, My Server is trash. Use the Website');
    }
    return schools;
  }

  @override
  Future<List<Section>> getAllSections(String school) async {
    var sections = <Section>[];
    try {
      var response = await _dioClient.get('/sections?school=${school}');
      for (final item in response.data) {
        var section = Section.fromJson(item);
        sections.add(section);
      }
    } on SocketException {
      throw Failure('Your internet is trash.');
    } on FormatException {
      throw Failure('My Server is crazy. Please retry later.');
    } on HttpException {
      throw Failure('Bruh Moment, My Server is trash. Use the Website');
    }
    return sections;
  }

  @override
  Future<Subject> getSubject(String code) async {
    Subject subject;
    try {
      var response = await _dioClient.get('/subjects?subject=${code}');
      subject = Subject.fromJson(response.data);
    } on SocketException {
      throw Failure('Your internet is trash.');
    } on FormatException {
      throw Failure('My Server is crazy. Please retry later.');
    } on HttpException {
      throw Failure('Bruh Moment, My Server is trash. Use the Website');
    }
    return subject;
  }

  @override
  Future<Teacher> getTeacher(int teacherId) async {
    Teacher teacher;
    try {
      var response = await _dioClient.get('/teachers?teacher_id=${teacherId}');
      teacher = Teacher.fromJson(response.data);
    } on SocketException {
      throw Failure('Your internet is trash.');
    } on FormatException {
      throw Failure('My Server is crazy. Please retry later.');
    } on HttpException {
      throw Failure('Bruh Moment, My Server is trash. Use the Website');
    }
    return teacher;
  }

  @override
  Future<Timetable> getTimetable(int section) async {
    Timetable timetable;
    try {
      var response = await _dioClient.get('/timetable?section=${section}');
      timetable = Timetable.fromJson(response.data);
    } on SocketException {
      throw Failure('Your internet is trash.');
    } on FormatException catch (e) {
      throw Failure('My Server is crazy. Please retry later.' + e.toString());
    } on HttpException {
      throw Failure('Bruh Moment, My Server is trash. Use the Website');
    }
    return timetable;
  }
}
