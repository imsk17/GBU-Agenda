import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

@JsonSerializable(nullable: false)
class School {
  @JsonKey(name: 'school')
  String name;
  @JsonKey(name: 'full_name')
  String fullName;
  @JsonKey(name: 'id')
  int id;
  School({
    this.name,
    this.fullName,
    this.id,
  });
  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolToJson(this);

  @override
  String toString() => 'School(name: $name, fullName: $fullName, id: $id)';
}
