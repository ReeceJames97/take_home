import 'package:json_annotation/json_annotation.dart';
import 'package:take_home_pj/models/take_home_models/slots.dart';

part 'slots_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SlotsModel {
  String date;

  List<Slots> slots;

  SlotsModel(this.date, this.slots);

  factory SlotsModel.fromJson(Map<String, dynamic> json) =>
      _$SlotsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlotsModelToJson(this);
}
