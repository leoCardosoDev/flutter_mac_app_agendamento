import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_theme.dart';

class AppDivider extends StatelessWidget {
  final String? text;
  const AppDivider({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Row(
      children: [
        Expanded(child: Divider(color: theme.gray)),
        if (text != null)
          Expanded(
              child: Center(
                  child: Text(
            text!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: theme.black,
            ),
          ))),
        Expanded(child: Divider(color: theme.gray)),
      ],
    );
  }
}
