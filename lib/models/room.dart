import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable(nullable: false)
class Room {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'building')
  String building;
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
