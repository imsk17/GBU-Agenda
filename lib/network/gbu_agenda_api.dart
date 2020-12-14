import 'dart:io';

import 'package:GbuAgenda/models/school.dart';
import 'package:GbuAgenda/models/section.dart';
import 'package:GbuAgenda/models/subject.dart';
import 'package:GbuAgenda/models/teacher.dart';
import 'package:GbuAgenda/models/timetable.dart';
import 'package:GbuAgenda/network/api.dart';
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
    final sections = <Section>[];
    try {
      final response = await _dioClient.get('/sections?school=$school');
      for (final item in response.data) {
        final section = Section.fromJson(item as Map<String, dynamic>);
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
      final response = await _dioClient.get('/subjects?subject=$code');
      subject = Subject.fromJson(response.data as Map<String, dynamic>);
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
      final response = await _dioClient.get('/teachers?teacher_id=$teacherId');
      teacher = Teacher.fromJson(response.data as Map<String, dynamic>);
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
      final response = await _dioClient.get('/timetable?section=$section');
      timetable = Timetable.fromJson(response.data as Map<String, dynamic>);
    } on SocketException {
      throw Failure('Your internet is trash.');
    } on FormatException catch (e) {
      throw Failure('My Server is crazy. Please retry later. $e');
    } on HttpException {
      throw Failure('Bruh Moment, My Server is trash. Use the Website');
    }
    return timetable;
  }
}
