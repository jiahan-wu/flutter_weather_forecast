import 'package:flutter/material.dart';

import 'package:flutter_weather_forecast/widgets/weather_forecast_query_result_view.dart';
import 'package:flutter_weather_forecast/widgets/weather_forecast_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              WeatherForecastSearchBar(),
              Expanded(
                child: WeatherForecastQueryResultView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
