import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 24,
        ),
        const SizedBox(height: 12),
        Text(
          "系統異常",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.red),
        ),
        const SizedBox(height: 4),
        Text(
          error.toString(),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.red),
        )
      ],
    );
  }
}
