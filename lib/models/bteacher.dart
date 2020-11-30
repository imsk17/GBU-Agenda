import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bteacher.g.dart';

@HiveType(typeId: 8)
@JsonSerializable(nullable: false)
class BTeacher {
  @HiveField(0)
  @JsonKey(name: 'id')
  int id;
  @HiveField(1)
  @JsonKey(name: 'abbr')
  String abbr;
  @HiveField(2)
  @JsonKey(name: 'name')
  String name;
  BTeacher({this.name, this.abbr, this.id});
  factory BTeacher.fromJson(Map<String, dynamic> json) =>
      _$BTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$BTeacherToJson(this);

  @override
  String toString() => 'BTeacher(id: $id, abbr: $abbr, name: $name)';
}
