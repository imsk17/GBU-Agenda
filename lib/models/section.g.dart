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
      sectionName: fields[1] as String,
      sectionId: fields[0] as int,
      programName: fields[4] as String,
      semester: fields[2] as int,
      programId: fields[3] as int,
      isActive: fields[6] as int,
      school: fields[5] as String,
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
