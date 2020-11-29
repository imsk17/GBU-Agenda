// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return Subject(
    school: json['school'] as String,
    deptCode: json['dept_code'] as String,
    isLab: json['is_lab'] as int,
    l: json['L'] as int,
    t: json['T'] as int,
    p: json['P'] as int,
    deptName: json['dpt_name'] as String,
    subCode: json['sub_code'] as String,
    subId: json['sub_id'] as int,
    subName: json['sub_name'] as String,
  );
}

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'sub_id': instance.subId,
      'sub_name': instance.subName,
      'sub_code': instance.subCode,
      'is_lab': instance.isLab,
      'L': instance.l,
      'T': instance.t,
      'P': instance.p,
      'dept_code': instance.deptCode,
      'dpt_name': instance.deptName,
      'school': instance.school,
    };
