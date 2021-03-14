import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@HiveType(typeId: 9)
@JsonSerializable()
class Room {
  @HiveField(0)
  @JsonKey(name: 'id')
  int id;
  @HiveField(1)
  @JsonKey(name: 'name')
  String name;
  @HiveField(2)
  @JsonKey(name: 'building')
  String building;
  @HiveField(3)
  @JsonKey(name: 'is_lab')
  int isLab;

  Room({this.id, this.isLab, this.name, this.building});

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  String toString() {
    return 'Room(id: $id, name: $name, building: $building, isLab: $isLab)';
  }
}
