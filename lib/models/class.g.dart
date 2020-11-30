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
      batch: fields[1] as int,
      period: fields[0] as int,
      room: fields[3] as Room,
      subject: fields[2] as BSubject,
      teacher: fields[4] as BTeacher,
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
