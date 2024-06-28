import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(),
        ),
        const SizedBox(height: 12),
        Text(
          "查詢中...",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
