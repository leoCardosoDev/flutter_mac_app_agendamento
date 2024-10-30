import 'package:app_agendamento/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String body;
  final List<Widget> actions;
  const AppAlertDialog({
    super.key,
    required this.title,
    required this.body,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: theme.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              body,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: theme.black,
              ),
            ),
            const SizedBox(height: 10),
            ...actions,
          ],
        ),
      ),
    );
  }
}
