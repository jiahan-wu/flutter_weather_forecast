import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'package:flutter_weather_forecast/models/forecast_parameter.dart';
import 'package:flutter_weather_forecast/models/location.dart';

class Entity {
  Entity({
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.forecastParameter,
  });

  final String name;
  final DateTime startTime;
  final DateTime endTime;
  final ForecastParameter forecastParameter;
}

class WeatherForecastDataCard extends StatelessWidget {
  const WeatherForecastDataCard({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    final entities = location.elements.map((weatherElement) {
      return weatherElement.forecasts.map((forecast) {
        return Entity(
          name: weatherElement.name,
          startTime: forecast.startTime,
          endTime: forecast.endTime,
          forecastParameter: forecast.parameter,
        );
      });
    }).expand((e) => e);
    final entitiesByStartTime = groupBy(entities, (e) => e.startTime);
    final sortedStartTimes = entitiesByStartTime.keys.toList()..sort();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "今明 36 小時天氣預報 - 查詢結果",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
          const Divider(),
          ...sortedStartTimes.map((startTime) {
            final entities = entitiesByStartTime[startTime] ?? [];

            final wx = entities.firstWhereOrNull((e) => e.name == "Wx");
            final ci = entities.firstWhereOrNull((e) => e.name == "CI");
            final pop = entities.firstWhereOrNull((e) => e.name == "PoP");
            final minT = entities.firstWhereOrNull((e) => e.name == "MinT");
            final maxT = entities.firstWhereOrNull((e) => e.name == "MaxT");

            final dateFormat = DateFormat("yyyy/MM/dd");
            final title = dateFormat.format(startTime);

            final timeFormat = DateFormat.Hm();
            final endTime = entities.firstOrNull?.endTime;
            final subtitle = endTime != null
                ? "${timeFormat.format(startTime)} - ${timeFormat.format(endTime)}"
                : "";

            return Card.outlined(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title $subtitle",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "天氣現象",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "舒適度",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "降雨機率",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            wx?.forecastParameter.name ?? "",
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            ci?.forecastParameter.name ?? "",
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            pop == null
                                ? "?"
                                : "${pop.forecastParameter.name}%",
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "最低溫度",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "最高溫度",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            minT == null
                                ? "?"
                                : "${minT.forecastParameter.name} °C",
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            maxT == null
                                ? "?"
                                : "${maxT.forecastParameter.name} °C",
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
