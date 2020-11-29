import 'package:json_annotation/json_annotation.dart';

part 'bteacher.g.dart';

@JsonSerializable(nullable: false)
class BTeacher {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'abbr')
  String abbr;
  @JsonKey(name: 'name')
  String name;
  BTeacher({this.name, this.abbr, this.id});
  factory BTeacher.fromJson(Map<String, dynamic> json) =>
      _$BTeacherFromJson(json);
  Map<String, dynamic> toJson() => _$BTeacherToJson(this);

  @override
  String toString() => 'BTeacher(id: $id, abbr: $abbr, name: $name)';
}
