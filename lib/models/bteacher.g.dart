// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bteacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BTeacher _$BTeacherFromJson(Map<String, dynamic> json) {
  return BTeacher(
    name: json['name'] as String,
    abbr: json['abbr'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$BTeacherToJson(BTeacher instance) => <String, dynamic>{
      'id': instance.id,
      'abbr': instance.abbr,
      'name': instance.name,
    };
