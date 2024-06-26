import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_weather_forecast/models/records.dart';

part 'weather_api_response.g.dart';

@JsonSerializable()
class WeatherApiResponse {
  WeatherApiResponse({
    required this.records,
  });

  final Records records;

  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherApiResponseToJson(this);
}
