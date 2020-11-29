import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable(nullable: false)
class Subject {
  @JsonKey(name: 'sub_id')
  int subId;
  @JsonKey(name: 'sub_name')
  String subName;
  @JsonKey(name: 'sub_code')
  String subCode;
  @JsonKey(name: 'is_lab')
  int isLab;
  @JsonKey(name: 'L')
  int l;
  @JsonKey(name: 'T')
  int t;
  @JsonKey(name: 'P')
  int p;
  @JsonKey(name: 'dept_code')
  String deptCode;
  @JsonKey(name: 'dpt_name')
  String deptName;
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
