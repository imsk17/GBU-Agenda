import 'package:gbuagenda/models/class.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timetable.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Timetable {
  @HiveField(0)
  final Map<String, List<Class>> days;
  Timetable({this.days, this.showTt});
  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
  Map<String, dynamic> toJson() => _$TimetableToJson(this);
  @HiveField(1)
  @JsonKey(name: "show_tt")
  final int showTt;

  @override
  String toString() => 'Timetable(days: $days)';
}
