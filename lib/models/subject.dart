import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(nullable: false)
class Subject {
  @HiveField(0)
  @JsonKey(name: 'sub_id')
  int subId;
  @HiveField(1)
  @JsonKey(name: 'sub_name')
  String subName;
  @HiveField(2)
  @JsonKey(name: 'sub_code')
  String subCode;
  @HiveField(3)
  @JsonKey(name: 'is_lab')
  int isLab;
  @HiveField(4)
  @JsonKey(name: 'L')
  int l;
  @HiveField(5)
  @JsonKey(name: 'T')
  int t;
  @HiveField(6)
  @JsonKey(name: 'P')
  int p;
  @HiveField(7)
  @JsonKey(name: 'dept_code')
  String deptCode;
  @HiveField(8)
  @JsonKey(name: 'dpt_name')
  String deptName;
  @HiveField(9)
  @JsonKey(name: 'school')
  String school;
  Subject(
      {this.school,
      this.deptCode,
      this.isLab,
      this.l,
      this.t,
      this.p,
      this.deptName,
      this.subCode,
      this.subId,
      this.subName});
  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  @override
  String toString() {
    return 'Subject(subId: $subId, subName: $subName, subCode: $subCode, isLab: $isLab, l: $l, t: $t, p: $p, deptCode: $deptCode, deptName: $deptName, school: $school)';
  }
}
