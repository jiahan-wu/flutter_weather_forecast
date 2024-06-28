import 'package:flutter/material.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.search, size: 24),
        const SizedBox(height: 12),
        Text(
          "查無相關資料",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
