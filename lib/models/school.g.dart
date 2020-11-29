// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) {
  return School(
    name: json['school'] as String,
    fullName: json['full_name'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'school': instance.name,
      'full_name': instance.fullName,
      'id': instance.id,
    };
