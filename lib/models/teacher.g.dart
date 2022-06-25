// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherAdapter extends TypeAdapter<Teacher> {
  @override
  final int typeId = 5;

  @override
  Teacher read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Teacher(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Teacher obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.abbr)
      ..writeByte(3)
      ..write(obj.school)
      ..writeByte(4)
      ..write(obj.department)
      ..writeByte(5)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      json['id'] as int,
      json['name'] as String,
      json['abbr'] as String,
      json['school'] as String,
      json['department'] as String,
      json['is_active'] as int,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbr': instance.abbr,
      'school': instance.school,
      'department': instance.department,
      'is_active': instance.isActive,
    };
