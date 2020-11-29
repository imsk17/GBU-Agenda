// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    id: json['id'] as int,
    name: json['name'] as String,
    abbr: json['abbr'] as String,
    school: json['school'] as String,
    department: json['department'] as String,
    isActive: json['is_active'] as int,
  );
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbr': instance.abbr,
      'school': instance.school,
      'department': instance.department,
      'is_active': instance.isActive,
    };
