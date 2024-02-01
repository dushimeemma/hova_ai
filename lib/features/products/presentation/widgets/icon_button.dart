import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';

class CustomIconButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? borderColor;
  final Color? iconColor;
  final void Function()? onPressed;
  const CustomIconButton({
    super.key,
    this.label,
    this.icon,
    this.backgroundColor,
    this.labelColor,
    this.borderColor,
    this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon ?? Icons.exit_to_app,
        color: iconColor ?? scaffoldBgColor,
      ),
      label: Text(
        label ?? 'Logout',
        style: TextStyle(color: labelColor ?? scaffoldBgColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
        side: BorderSide(color: borderColor ?? scaffoldBgColor),
      ),
    );
  }
}
