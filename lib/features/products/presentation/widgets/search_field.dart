import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function()? onPressedSuffix;
  final String? hint;
  final bool showSuffix;
  const SearchTextField({
    super.key,
    this.onPressedSuffix,
    this.hint,
    this.showSuffix = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: showSuffix
            ? IconButton(
                icon: const Icon(Icons.qr_code_scanner_outlined),
                onPressed: onPressedSuffix,
              )
            : null,
        hintText: hint ?? 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
