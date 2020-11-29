// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) {
  return Day(
    classes: (json['classes'] as List)
        .map((e) => Class.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'classes': instance.classes,
    };
