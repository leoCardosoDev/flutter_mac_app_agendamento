import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onPressed;
  const AppIconButton({super.key, required this.iconPath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Material(
        type: MaterialType.transparency,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
