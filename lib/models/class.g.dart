// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClassAdapter extends TypeAdapter<Class> {
  @override
  final int typeId = 6;

  @override
  Class read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Class(
      fields[1] as int,
      fields[0] as int,
      fields[3] as Room,
      fields[2] as BSubject,
      fields[4] as BTeacher?,
    );
  }

  @override
  void write(BinaryWriter writer, Class obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.period)
      ..writeByte(1)
      ..write(obj.batch)
      ..writeByte(2)
      ..write(obj.subject)
      ..writeByte(3)
      ..write(obj.room)
      ..writeByte(4)
      ..write(obj.teacher);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class _$ClassFromJson(Map<String, dynamic> json) => Class(
      json['batch'] as int,
      json['period'] as int,
      Room.fromJson(json['room'] as Map<String, dynamic>),
      BSubject.fromJson(json['subject'] as Map<String, dynamic>),
      json['teacher'] == null
          ? null
          : BTeacher.fromJson(json['teacher'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClassToJson(Class instance) => <String, dynamic>{
      'period': instance.period,
      'batch': instance.batch,
      'subject': instance.subject,
      'room': instance.room,
      'teacher': instance.teacher,
    };
