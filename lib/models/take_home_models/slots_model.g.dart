// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotsModel _$SlotsModelFromJson(Map<String, dynamic> json) => SlotsModel(
      json['date'] as String,
      (json['slots'] as List<dynamic>)
          .map((e) => Slots.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlotsModelToJson(SlotsModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'slots': instance.slots.map((e) => e.toJson()).toList(),
    };
