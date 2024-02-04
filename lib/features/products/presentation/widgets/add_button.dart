import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  const AddButton({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon ?? Icons.add,
          color: color ?? Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            color: color ?? Colors.black,
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
