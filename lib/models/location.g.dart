// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['locationName'] as String,
      elements: (json['weatherElement'] as List<dynamic>)
          .map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'locationName': instance.name,
      'weatherElement': instance.elements,
    };
