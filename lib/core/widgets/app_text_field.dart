import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_theme.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final String hint;
  final String? initialText;
  final Function(String) onChanged;
  final TextInputType? textInputType;
  final bool obscure;
  const AppTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.onChanged,
    this.textInputType,
    this.initialText,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: theme.lightGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 8),
            child: Text(
              title,
              style: theme.label11Bold,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            initialValue: initialText,
            obscureText: obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(20, 6, 20, 15),
              isCollapsed: true,
              hintText: hint,
              hintStyle: theme.field15.copyWith(color: theme.gray),
            ),
            style: theme.field15,
            onChanged: onChanged,
            keyboardType: textInputType,
          ),
        ],
      ),
    );
  }
}
