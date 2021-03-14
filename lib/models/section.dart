import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Section {
  @HiveField(0)
  @JsonKey(name: 'section_id')
  int sectionId;
  @HiveField(1)
  @JsonKey(name: 'section_name')
  String sectionName;
  @HiveField(2)
  @JsonKey(name: 'semester')
  int semester;
  @HiveField(3)
  @JsonKey(name: 'program_id')
  int programId;
  @HiveField(4)
  @JsonKey(name: 'program_name')
  String programName;
  @HiveField(5)
  @JsonKey(name: 'school')
  String school;
  @HiveField(6)
  @JsonKey(name: 'is_active')
  int isActive;
  Section({
    this.sectionName,
    this.sectionId,
    this.programName,
    this.semester,
    this.programId,
    this.isActive,
    this.school,
  });
  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);

  @override
  String toString() {
    return 'Section(sectionId: $sectionId, sectionName: $sectionName, semester: $semester, programId: $programId, programName: $programName, school: $school, isActive: $isActive)';
  }
}
