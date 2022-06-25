import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teacher.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class Teacher {
  @HiveField(0)
  @JsonKey(name: 'id')
  int id;
  @HiveField(1)
  @JsonKey(name: 'name')
  String name;
  @HiveField(2)
  @JsonKey(name: 'abbr')
  String abbr;
  @HiveField(3)
  @JsonKey(name: 'school')
  String school;
  @HiveField(4)
  @JsonKey(name: 'department')
  String department;
  @HiveField(5)
  @JsonKey(name: 'is_active')
  int isActive;
  Teacher(
    this.id,
    this.name,
    this.abbr,
    this.school,
    this.department,
    this.isActive,
  );
  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
  Map<String, dynamic> toJson() => _$TeacherToJson(this);
  @override
  String toString() {
    return 'Teacher(id: $id, name: $name, abbr: $abbr, school: $school, department: $department, isActive: $isActive)';
  }
}
