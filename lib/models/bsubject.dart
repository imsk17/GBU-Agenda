import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bsubject.g.dart';

@JsonSerializable(nullable: false)
@HiveType(typeId: 7)
class BSubject {
  @HiveField(0)
  @JsonKey(name: 'code')
  String code;
  @HiveField(1)
  @JsonKey(name: 'name')
  String name;
  BSubject({this.code, this.name});
  factory BSubject.fromJson(Map<String, dynamic> json) =>
      _$BSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$BSubjectToJson(this);

  @override
  String toString() => 'BSubject(code: $code, name: $name)';
}
