// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slots _$SlotsFromJson(Map<String, dynamic> json) => Slots(
      json['start_time'] as String,
      json['end_time'] as String,
      json['available'] as bool,
    );

Map<String, dynamic> _$SlotsToJson(Slots instance) => <String, dynamic>{
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'available': instance.available,
    };
