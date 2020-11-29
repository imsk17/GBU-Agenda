import 'package:GbuAgenda/models/bteacher.dart';
import 'package:GbuAgenda/models/room.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bsubject.dart';

part 'class.g.dart';

@JsonSerializable(nullable: false)
class Class {
  @JsonKey(name: 'period')
  int period;
  @JsonKey(name: 'batch')
  int batch;
  @JsonKey(name: 'subject')
  BSubject subject;
  @JsonKey(name: 'room')
  Room room;
  @JsonKey(name: 'teacher')
  BTeacher teacher;

  Class({this.batch, this.period, this.room, this.subject, this.teacher});

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

  Map<String, dynamic> toJson() => _$ClassToJson(this);

  @override
  String toString() {
    return 'Class(period: $period, batch: $batch, subject: $subject, room: $room, teacher: $teacher)';
  }
}
