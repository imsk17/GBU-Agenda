// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  return Timetable(
    days: (json['days'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(
          k,
          (e as List)
              .map((e) => Class.fromJson(e as Map<String, dynamic>))
              .toList()),
    ),
  );
}

Map<String, dynamic> _$TimetableToJson(Timetable instance) => <String, dynamic>{
      'days': instance.days,
    };
