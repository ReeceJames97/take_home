import 'package:json_annotation/json_annotation.dart';

part 'slots.g.dart';

@JsonSerializable(explicitToJson: true)
class Slots {
  String start_time, end_time;
  bool available;

  Slots(this.start_time, this.end_time, this.available);

  factory Slots.fromJson(Map<String, dynamic> json) => _$SlotsFromJson(json);

  Map<String, dynamic> toJson() => _$SlotsToJson(this);
}
