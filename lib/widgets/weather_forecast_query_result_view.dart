import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_weather_forecast/providers/weather_forecast_provider.dart';
import 'package:flutter_weather_forecast/widgets/error_view.dart';
import 'package:flutter_weather_forecast/widgets/loading_indicator.dart';
import 'package:flutter_weather_forecast/widgets/no_data_view.dart';
import 'package:flutter_weather_forecast/widgets/weather_forecast_data_card.dart';
import 'package:flutter_weather_forecast/widgets/welcome_view.dart';

class WeatherForecastQueryResultView extends ConsumerWidget {
  const WeatherForecastQueryResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(weatherForecastProvider);

    return Center(
      child: switch (location) {
        AsyncData(:final value) => value == null
            ? const WelcomeView()
            : value.isEmpty
                ? const NoDataView()
                : Column(
                    children: [
                      WeatherForecastDataCard(location: value.first),
                      const Spacer(),
                    ],
                  ),
        AsyncError(:final error) => ErrorView(error: error),
        _ => const LoadingIndicator(),
      },
    );
  }
}
