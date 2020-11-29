import 'package:GbuAgenda/models/class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable(nullable: false)
class Day {
  List<Class> classes;

  Day({this.classes});

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  String toString() => 'Day(classes: $classes)';
}
