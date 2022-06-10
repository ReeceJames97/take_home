// To parse this JSON data, do
//
//     final price = priceFromJson(jsonString);

import 'dart:convert';

Price priceFromJson(String str) => Price.fromJson(json.decode(str));

String priceToJson(Price data) => json.encode(data.toJson());

class Price {
  Price({
    required this.prices,
    required this.currentTime,
  });

  final Prices prices;
  final String currentTime;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    prices: Prices.fromJson(json["prices"]),
    currentTime: json["current_time"],
  );

  Map<String, dynamic> toJson() => {
    "prices": prices.toJson(),
    "current_time": currentTime,
  };
}

class Prices {
  Prices({
    required this.ounce,
    required this.gram,
    required this.hundredGram,
    required this.thousandGram,
  });

  final Gram ounce;
  final Gram gram;
  final Gram hundredGram;
  final Gram thousandGram;

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
    ounce: Gram.fromJson(json["ounce"]),
    gram: Gram.fromJson(json["gram"]),
    hundredGram: Gram.fromJson(json["hundred_gram"]),
    thousandGram: Gram.fromJson(json["thousand_gram"]),
  );

  Map<String, dynamic> toJson() => {
    "ounce": ounce.toJson(),
    "gram": gram.toJson(),
    "hundred_gram": hundredGram.toJson(),
    "thousand_gram": thousandGram.toJson(),
  };
}

class Gram {
  Gram({
    required this.silver,
    required this.gold,
    required this.platinum,
  });

  final double silver;
  final double gold;
  final double platinum;

  factory Gram.fromJson(Map<String, dynamic> json) => Gram(
    silver: json["silver"].toDouble(),
    gold: json["gold"].toDouble(),
    platinum: json["platinum"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "silver": silver,
    "gold": gold,
    "platinum": platinum,
  };
}
