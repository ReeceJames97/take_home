// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prices_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricesResponseModel _$PricesResponseModelFromJson(Map<String, dynamic> json) =>
    PricesResponseModel(
      Prices.fromJson(json['prices'] as Map<String, dynamic>),
      json['current_time'] as String,
    );

Map<String, dynamic> _$PricesResponseModelToJson(
        PricesResponseModel instance) =>
    <String, dynamic>{
      'prices': instance.prices.toJson(),
      'current_time': instance.current_time,
    };

Prices _$PricesFromJson(Map<String, dynamic> json) => Prices(
      Ounce.fromJson(json['ounce'] as Map<String, dynamic>),
      Ounce.fromJson(json['gram'] as Map<String, dynamic>),
      Ounce.fromJson(json['hundred_gram'] as Map<String, dynamic>),
      Ounce.fromJson(json['thousand_gram'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricesToJson(Prices instance) => <String, dynamic>{
      'ounce': instance.ounce.toJson(),
      'gram': instance.gram.toJson(),
      'hundred_gram': instance.hundred_gram.toJson(),
      'thousand_gram': instance.thousand_gram.toJson(),
    };

Thousand_gram _$Thousand_gramFromJson(Map<String, dynamic> json) =>
    Thousand_gram(
      json['gold'],
      json['silver'],
      json['platinum'],
    );

Map<String, dynamic> _$Thousand_gramToJson(Thousand_gram instance) =>
    <String, dynamic>{
      'gold': instance.gold,
      'silver': instance.silver,
      'platinum': instance.platinum,
    };

Hundred_gram _$Hundred_gramFromJson(Map<String, dynamic> json) => Hundred_gram(
      json['gold'],
      json['silver'],
      json['platinum'],
    );

Map<String, dynamic> _$Hundred_gramToJson(Hundred_gram instance) =>
    <String, dynamic>{
      'gold': instance.gold,
      'silver': instance.silver,
      'platinum': instance.platinum,
    };

Gram _$GramFromJson(Map<String, dynamic> json) => Gram(
      json['gold'],
      json['silver'],
      json['platinum'],
    );

Map<String, dynamic> _$GramToJson(Gram instance) => <String, dynamic>{
      'gold': instance.gold,
      'silver': instance.silver,
      'platinum': instance.platinum,
    };

Ounce _$OunceFromJson(Map<String, dynamic> json) => Ounce(
      json['silver'],
      json['gold'],
      json['platinum'],
    );

Map<String, dynamic> _$OunceToJson(Ounce instance) => <String, dynamic>{
      'silver': instance.silver,
      'gold': instance.gold,
      'platinum': instance.platinum,
    };
