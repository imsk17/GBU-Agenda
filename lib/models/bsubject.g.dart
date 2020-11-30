// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bsubject.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BSubjectAdapter extends TypeAdapter<BSubject> {
  @override
  final int typeId = 7;

  @override
  BSubject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BSubject(
      code: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BSubject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BSubjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BSubject _$BSubjectFromJson(Map<String, dynamic> json) {
  return BSubject(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BSubjectToJson(BSubject instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
