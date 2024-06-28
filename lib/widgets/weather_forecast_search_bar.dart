import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_weather_forecast/providers/weather_forecast_provider.dart';

class WeatherForecastSearchBar extends ConsumerStatefulWidget {
  const WeatherForecastSearchBar({super.key});

  @override
  ConsumerState<WeatherForecastSearchBar> createState() =>
      _WeatherForecastSearchBarState();
}

class _WeatherForecastSearchBarState
    extends ConsumerState<WeatherForecastSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "天氣預報",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              "輸入您想查詢的位置，獲取即時天氣資訊。",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "輸入位置（如花蓮縣、宜蘭縣）",
              border: OutlineInputBorder(),
            ),
            onSubmitted: (text) {
              if (text.isNotEmpty) {
                 ref
                      .read(weatherForecastProvider.notifier)
                      .query(_controller.text);
              }
            },
          ),
        ),
        ElevatedButton(
          onPressed: _controller.text.isEmpty ||
                  ref.watch(weatherForecastProvider).isLoading
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();

                  ref
                      .read(weatherForecastProvider.notifier)
                      .query(_controller.text);
                },
          child: const Text("查詢"),
        )
      ],
    );
  }
}
