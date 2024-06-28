import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_weather_forecast/models/location.dart';
import 'package:flutter_weather_forecast/models/weather_api_response.dart';
import 'package:flutter_weather_forecast/providers/access_token_provider.dart';
import 'package:flutter_weather_forecast/providers/dio_provider.dart';

part 'weather_forecast_provider.g.dart';

@riverpod
class WeatherForecast extends _$WeatherForecast {
  @override
  Future<List<Location>?> build() async => null;

  Future<void> query(String locationName) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final dio = ref.watch(dioProvider);

      final accessToken = ref.watch(accessTokenProvider);

      final response = await dio.get(
        "/api/v1/rest/datastore/F-C0032-001",
        queryParameters: {
          "locationName": locationName,
          "Authorization": accessToken,
        },
        options: Options(headers: {"accept": "application/json"}),
      );

      final weatherApiResponse = WeatherApiResponse.fromJson(response.data);

      final locations = weatherApiResponse.records.locations;

      return locations;
    });
  }
}
