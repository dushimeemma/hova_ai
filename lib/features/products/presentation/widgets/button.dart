import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  final Color? bgColor;
  final double? width;
  final double? height;
  final double? borderWidth;
  final Color? borderColor;
  const RoundedButton({
    super.key,
    this.onTap,
    this.child,
    this.bgColor,
    this.width,
    this.height,
    this.borderWidth,
    this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 40,
        height: height ?? 40,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          border: Border.all(
            color: borderColor ?? scaffoldBgColor,
            width: borderWidth ?? 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: child ??
              const Icon(
                Icons.more_horiz,
                size: 24,
              ),
        ),
      ),
    );
  }
}
