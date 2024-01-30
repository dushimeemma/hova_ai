import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final void Function()? onPressed;
  const SearchTextField({
    super.key,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.qr_code_scanner_outlined),
          onPressed: onPressed,
        ),
        hintText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
