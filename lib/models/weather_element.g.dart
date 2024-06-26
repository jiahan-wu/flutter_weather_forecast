// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherElement _$WeatherElementFromJson(Map<String, dynamic> json) =>
    WeatherElement(
      name: json['elementName'] as String,
      forecasts: (json['time'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherElementToJson(WeatherElement instance) =>
    <String, dynamic>{
      'elementName': instance.name,
      'time': instance.forecasts,
    };
