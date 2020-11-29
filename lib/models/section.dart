import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable(nullable: false)
class Section {
  @JsonKey(name: 'section_id')
  int sectionId;
  @JsonKey(name: 'section_name')
  String sectionName;
  @JsonKey(name: 'semester')
  int semester;
  @JsonKey(name: 'program_id')
  int programId;
  @JsonKey(name: 'program_name')
  String programName;
  @JsonKey(name: 'school')
  String school;
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
