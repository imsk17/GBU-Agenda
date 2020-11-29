// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class _$ClassFromJson(Map<String, dynamic> json) {
  return Class(
    batch: json['batch'] as int,
    period: json['period'] as int,
    room: Room.fromJson(json['room'] as Map<String, dynamic>),
    subject: BSubject.fromJson(json['subject'] as Map<String, dynamic>),
    teacher: BTeacher.fromJson(json['teacher'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'period': instance.period,
      'batch': instance.batch,
      'subject': instance.subject,
      'room': instance.room,
      'teacher': instance.teacher,
    };
