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
      fields[9] as String,
      fields[7] as String,
      fields[3] as int,
      fields[4] as int,
      fields[5] as int,
      fields[6] as int,
      fields[8] as String,
      fields[2] as String,
      fields[0] as int,
      fields[1] as String,
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

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      json['school'] as String,
      json['dept_code'] as String,
      json['is_lab'] as int,
      json['L'] as int,
      json['T'] as int,
      json['P'] as int,
      json['dpt_name'] as String,
      json['sub_code'] as String,
      json['sub_id'] as int,
      json['sub_name'] as String,
    );

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
