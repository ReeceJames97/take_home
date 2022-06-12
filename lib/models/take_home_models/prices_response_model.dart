import 'package:json_annotation/json_annotation.dart';

part 'prices_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PricesResponseModel {
  Prices prices;
  String current_time;

  PricesResponseModel(this.prices, this.current_time);

  factory PricesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PricesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PricesResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Prices {
  Ounce ounce;
  Ounce gram;
  Ounce hundred_gram;
  Ounce thousand_gram;

  Prices(this.ounce, this.gram, this.hundred_gram, this.thousand_gram);

  factory Prices.fromJson(Map<String, dynamic> json) => _$PricesFromJson(json);

  Map<String, dynamic> toJson() => _$PricesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Thousand_gram {
  dynamic gold;
  dynamic silver;
  dynamic platinum;

  Thousand_gram(this.gold, this.silver, this.platinum);

  factory Thousand_gram.fromJson(Map<String, dynamic> json) =>
      _$Thousand_gramFromJson(json);

  Map<String, dynamic> toJson() => _$Thousand_gramToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Hundred_gram {
  dynamic gold;
  dynamic silver;
  dynamic platinum;

  Hundred_gram(this.gold, this.silver, this.platinum);

  factory Hundred_gram.fromJson(Map<String, dynamic> json) =>
      _$Hundred_gramFromJson(json);

  Map<String, dynamic> toJson() => _$Hundred_gramToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Gram {
  dynamic gold;
  dynamic silver;
  dynamic platinum;

  Gram(this.gold, this.silver, this.platinum);

  factory Gram.fromJson(Map<String, dynamic> json) => _$GramFromJson(json);

  Map<String, dynamic> toJson() => _$GramToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Ounce {
  dynamic silver;
  dynamic gold;
  dynamic platinum;

  Ounce(this.silver, this.gold, this.platinum);

  factory Ounce.fromJson(Map<String, dynamic> json) => _$OunceFromJson(json);

  Map<String, dynamic> toJson() => _$OunceToJson(this);
}
