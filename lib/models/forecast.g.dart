// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      parameter:
          ForecastParameter.fromJson(json['parameter'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'parameter': instance.parameter,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
    };
