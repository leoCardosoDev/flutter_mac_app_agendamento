import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/app_theme.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final String hint;
  final String? initialText;
  final Function(String) onChanged;
  final TextInputType? textInputType;
  final bool obscure;
  final List<TextInputFormatter>? inputFormartters;
  final String? error;
  const AppTextField(
      {super.key,
      required this.title,
      required this.hint,
      required this.onChanged,
      this.textInputType,
      this.initialText,
      this.inputFormartters,
      this.obscure = false,
      this.error});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: theme.lightGray,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: theme.label11Bold,
                        textAlign: TextAlign.start,
                      ),
                      if (widget.error != null)
                        Expanded(
                            child: Text(
                          widget.error!,
                          textAlign: TextAlign.end,
                          style: theme.label11.copyWith(
                            color: theme.red,
                            fontWeight: FontWeight.w800,
                          ),
                        ))
                    ],
                  ),
                ),
                TextFormField(
                  initialValue: widget.initialText,
                  obscureText: widget.obscure && hidePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(20, 6, 20, 15),
                    isCollapsed: true,
                    hintText: widget.hint,
                    hintStyle: theme.field15.copyWith(color: theme.gray),
                  ),
                  style: theme.field15,
                  onChanged: widget.onChanged,
                  keyboardType: widget.textInputType,
                  inputFormatters: widget.inputFormartters,
                ),
              ],
            ),
          ),
          if (widget.obscure)
            SizedBox(
              width: 48,
              height: 48,
              child: Material(
                type: MaterialType.transparency,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: theme.gray,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
