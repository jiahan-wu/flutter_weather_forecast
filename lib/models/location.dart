import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_weather_forecast/models/weather_element.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({
    required this.name,
    required this.elements,
  });

  @JsonKey(name: "locationName")
  final String name;

  @JsonKey(name: "weatherElement")
  final List<WeatherElement> elements;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
