import 'package:gbuagenda/models/bteacher.dart';
import 'package:gbuagenda/models/room.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'bsubject.dart';

part 'class.g.dart';

@HiveType(typeId: 6)
@JsonSerializable()
class Class {
  @HiveField(0)
  @JsonKey(name: 'period')
  int period;
  @HiveField(1)
  @JsonKey(name: 'batch')
  int batch;
  @HiveField(2)
  @JsonKey(name: 'subject')
  BSubject subject;
  @HiveField(3)
  @JsonKey(name: 'room')
  Room room;
  @HiveField(4)
  @JsonKey(name: 'teacher')
  BTeacher teacher;

  Class(
    this.batch,
    this.period,
    this.room,
    this.subject,
    this.teacher,
  );

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);

  Map<String, dynamic> toJson() => _$ClassToJson(this);

  @override
  String toString() {
    return 'Class(period: $period, batch: $batch, subject: $subject, room: $room, teacher: $teacher)';
  }
}
