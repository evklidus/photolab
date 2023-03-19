import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRefreshPressed,
  });

  final String errorMessage;
  final VoidCallback onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        OutlinedButton.icon(
          onPressed: onRefreshPressed,
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Попробовать снова'),
        ),
      ],
    );
  }
}
