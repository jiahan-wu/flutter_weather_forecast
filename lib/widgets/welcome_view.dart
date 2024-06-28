import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.sunny,
          size: 64,
          color: Colors.yellow,
        ),
        const SizedBox(
          height: 12,
        ),
        Text("歡迎使用天氣預報查詢服務", style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
