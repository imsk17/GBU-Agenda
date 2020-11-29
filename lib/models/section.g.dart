// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) {
  return Section(
    sectionName: json['section_name'] as String,
    sectionId: json['section_id'] as int,
    programName: json['program_name'] as String,
    semester: json['semester'] as int,
    programId: json['program_id'] as int,
    isActive: json['is_active'] as int,
    school: json['school'] as String,
  );
}

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'section_id': instance.sectionId,
      'section_name': instance.sectionName,
      'semester': instance.semester,
      'program_id': instance.programId,
      'program_name': instance.programName,
      'school': instance.school,
      'is_active': instance.isActive,
    };
