// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bteacher.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BTeacherAdapter extends TypeAdapter<BTeacher> {
  @override
  final int typeId = 8;

  @override
  BTeacher read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BTeacher(
      name: fields[2] as String,
      abbr: fields[1] as String,
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BTeacher obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.abbr)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BTeacherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
