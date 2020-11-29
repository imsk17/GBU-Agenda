import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@JsonSerializable(nullable: false)
class Teacher {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'abbr')
  String abbr;
  @JsonKey(name: 'school')
  String school;
  @JsonKey(name: 'department')
  String department;
  @JsonKey(name: 'is_active')
  int isActive;
  Teacher({
    this.id,
    this.name,
    this.abbr,
    this.school,
    this.department,
    this.isActive,
  });
  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
  @override
  String toString() {
    return 'Teacher(id: $id, name: $name, abbr: $abbr, school: $school, department: $department, isActive: $isActive)';
  }
}
