// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiResponse _$WeatherApiResponseFromJson(Map<String, dynamic> json) =>
    WeatherApiResponse(
      records: Records.fromJson(json['records'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherApiResponseToJson(WeatherApiResponse instance) =>
    <String, dynamic>{
      'records': instance.records,
    };
