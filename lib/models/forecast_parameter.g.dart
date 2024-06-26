// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastParameter _$ForecastParameterFromJson(Map<String, dynamic> json) =>
    ForecastParameter(
      name: json['parameterName'] as String? ?? '',
      value: json['parameterValue'] as String? ?? '',
      unit: json['parameterUnit'] as String? ?? '',
    );

Map<String, dynamic> _$ForecastParameterToJson(ForecastParameter instance) =>
    <String, dynamic>{
      'parameterName': instance.name,
      'parameterValue': instance.value,
      'parameterUnit': instance.unit,
    };
