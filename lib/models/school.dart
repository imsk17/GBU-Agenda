import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

@JsonSerializable(nullable: false)
@HiveType(typeId: 1)
class School {
  @HiveField(0)
  @JsonKey(name: 'name')
  String name;
  @HiveField(1)
  @JsonKey(name: 'full_name')
  String fullName;
  @HiveField(2)
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
