import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_theme.dart';

class AppOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final String? iconPath;
  const AppOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        minimumSize: WidgetStateProperty.all(const Size(128, 64)),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return theme.lightGray;
          }
          return theme.primary;
        }),
        side: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(color: theme.lightGray);
          }
          return BorderSide(color: theme.primary);
        }),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
      child: Row(
        children: [
          if (iconPath != null) const SizedBox(width: 24),
          Expanded(child: Center(child: Text(label))),
          if (iconPath != null) SvgPicture.asset(iconPath!),
        ],
      ),
    );
  }
}
