import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../theme/app_theme.dart';
import 'app_icon_button.dart';

class AppBasePage extends StatefulWidget {
  final String title;
  final Widget body;
  final bool isLoading;
  final EdgeInsets bodyPadding;
  const AppBasePage({
    super.key,
    required this.title,
    required this.body,
    required this.isLoading,
    this.bodyPadding = const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
  });

  @override
  State<AppBasePage> createState() => _AppBasePageState();
}

class _AppBasePageState extends State<AppBasePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 5,
    );
  }

  @override
  void didUpdateWidget(covariant AppBasePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      controller.forward();
    } else if (oldWidget.isLoading && !widget.isLoading) {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = context.watch();
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(
                top: MediaQuery.paddingOf(context).top +
                    64 +
                    widget.bodyPadding.top,
                bottom: MediaQuery.paddingOf(context).bottom +
                    widget.bodyPadding.bottom,
                left: widget.bodyPadding.left,
                right: widget.bodyPadding.right,
              ),
              child: widget.body,
            ),
            Positioned(
              child: AbsorbPointer(
                absorbing: widget.isLoading,
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      final value = controller.value;
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
                        child: Container(
                          alignment: Alignment.center,
                          child: widget.isLoading
                              ? LoadingAnimationWidget.stretchedDots(
                                  color: theme.primary,
                                  size: 60,
                                )
                              : null,
                        ),
                      );
                    }),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: theme.bg,
                elevation: 4,
                shadowColor: theme.lightGray,
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
                            widget.title,
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
      ),
    );
  }
}
