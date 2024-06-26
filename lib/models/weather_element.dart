import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_weather_forecast/models/forecast.dart';

part 'weather_element.g.dart';

@JsonSerializable()
class WeatherElement {
  WeatherElement({
    required this.name,
    required this.forecasts,
  });

  @JsonKey(name: "elementName")
  final String name;

  @JsonKey(name: "time")
  final List<Forecast> forecasts;

  factory WeatherElement.fromJson(Map<String, dynamic> json) =>
      _$WeatherElementFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherElementToJson(this);
}
