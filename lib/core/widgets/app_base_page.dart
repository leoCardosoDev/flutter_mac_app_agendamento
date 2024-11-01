import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import 'app_icon_button.dart';

class AppBasePage extends StatelessWidget {
  final String title;
  final Widget body;
  final EdgeInsets bodyPadding;
  const AppBasePage({
    super.key,
    required this.title,
    required this.body,
    this.bodyPadding = const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.paddingOf(context).top + 64 + bodyPadding.top,
              bottom: MediaQuery.paddingOf(context).bottom + bodyPadding.bottom,
              left: bodyPadding.left,
              right: bodyPadding.right,
            ),
            child: body,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              color: theme.bg,
              elevation: 8,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(36),
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIconButton(
                        iconPath: 'assets/icons/chevron_left.svg',
                        onPressed: context.pop,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: theme.body16Bold,
                        ),
                      ),
                      const SizedBox(width: 48)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
