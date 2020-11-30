import 'package:GbuAgenda/models/class.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timetable.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(nullable: false)
class Timetable {
  @HiveField(0)
  final Map<String, List<Class>> days;
  Timetable({this.days});
  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
  Map<String, dynamic> toJson() => _$TimetableToJson(this);

  @override
  String toString() => 'Timetable(days: $days)';
}
