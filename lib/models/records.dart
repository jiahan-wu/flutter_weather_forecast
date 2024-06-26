import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_weather_forecast/models/location.dart';

part 'records.g.dart';

@JsonSerializable()
class Records {
  Records({
    required this.locations,
  });

  @JsonKey(name: "location")
  final List<Location> locations;

  factory Records.fromJson(Map<String, dynamic> json) =>
      _$RecordsFromJson(json);

  Map<String, dynamic> toJson() => _$RecordsToJson(this);
}
