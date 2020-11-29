import 'package:json_annotation/json_annotation.dart';

part 'bsubject.g.dart';

@JsonSerializable(nullable: false)
class BSubject {
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'name')
  String name;
  BSubject({this.code, this.name});
  factory BSubject.fromJson(Map<String, dynamic> json) =>
      _$BSubjectFromJson(json);
  Map<String, dynamic> toJson() => _$BSubjectToJson(this);

  @override
  String toString() => 'BSubject(code: $code, name: $name)';
}
