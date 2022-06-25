// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SectionAdapter extends TypeAdapter<Section> {
  @override
  final int typeId = 2;

  @override
  Section read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Section(
      fields[1] as String,
      fields[0] as int,
      fields[4] as String,
      fields[2] as int,
      fields[3] as int,
      fields[6] as int,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Section obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.sectionId)
      ..writeByte(1)
      ..write(obj.sectionName)
      ..writeByte(2)
      ..write(obj.semester)
      ..writeByte(3)
      ..write(obj.programId)
      ..writeByte(4)
      ..write(obj.programName)
      ..writeByte(5)
      ..write(obj.school)
      ..writeByte(6)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      json['section_name'] as String,
      json['section_id'] as int,
      json['program_name'] as String,
      json['semester'] as int,
      json['program_id'] as int,
      json['is_active'] as int,
      json['school'] as String,
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'section_id': instance.sectionId,
      'section_name': instance.sectionName,
      'semester': instance.semester,
      'program_id': instance.programId,
      'program_name': instance.programName,
      'school': instance.school,
      'is_active': instance.isActive,
    };
