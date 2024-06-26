import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_weather_forecast/models/forecast_parameter.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Forecast({
    required this.parameter,
    required this.startTime,
    required this.endTime,
  });

  final ForecastParameter parameter;

  final DateTime startTime;

  final DateTime endTime;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
