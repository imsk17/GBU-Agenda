// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectAdapter extends TypeAdapter<Subject> {
  @override
  final int typeId = 4;

  @override
  Subject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subject(
      school: fields[9] as String,
      deptCode: fields[7] as String,
      isLab: fields[3] as int,
      l: fields[4] as int,
      t: fields[5] as int,
      p: fields[6] as int,
      deptName: fields[8] as String,
      subCode: fields[2] as String,
      subId: fields[0] as int,
      subName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Subject obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.subId)
      ..writeByte(1)
      ..write(obj.subName)
      ..writeByte(2)
      ..write(obj.subCode)
      ..writeByte(3)
      ..write(obj.isLab)
      ..writeByte(4)
      ..write(obj.l)
      ..writeByte(5)
      ..write(obj.t)
      ..writeByte(6)
      ..write(obj.p)
      ..writeByte(7)
      ..write(obj.deptCode)
      ..writeByte(8)
      ..write(obj.deptName)
      ..writeByte(9)
      ..write(obj.school);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
