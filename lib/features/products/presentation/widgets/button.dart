import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(40.0, 40.0),
        foregroundColor: scaffoldBgColor,
        backgroundColor: Colors.white,
        side: const BorderSide(color: scaffoldBgColor, width: 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Icon(
        Icons.more_horiz,
        size: 24,
      ),
    );
  }
}
