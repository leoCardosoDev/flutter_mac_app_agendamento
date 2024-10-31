import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_theme.dart';

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const AppTextButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return TextButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(64, 64)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        foregroundColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return theme.lightGray;
            }
            return theme.black;
          },
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20),
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        overlayColor: WidgetStateProperty.all(theme.lightGray),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
