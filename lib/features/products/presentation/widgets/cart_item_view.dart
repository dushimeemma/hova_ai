import 'package:flutter/material.dart';

class CartItemView extends StatelessWidget {
  final int idx;
  final double height;
  final double width;
  final Map<String, dynamic> item;
  final Color rowColor;
  const CartItemView({
    super.key,
    required this.idx,
    required this.height,
    required this.width,
    required this.item,
    required this.rowColor,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: idx == 7 ? Colors.white : Colors.black,
      fontWeight: idx == 5 ? FontWeight.bold : FontWeight.normal,
    );
    return Container(
      height: (height * 0.4) * 1 / 8,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: rowColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            idx == 0 ? 24.0 : 0.0,
          ),
          topRight: Radius.circular(
            idx == 0 ? 24.0 : 0.0,
          ),
          bottomLeft: Radius.circular(
            idx == 7 ? 24.0 : 0.0,
          ),
          bottomRight: Radius.circular(
            idx == 7 ? 24.0 : 0.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: item.entries
                .map(
                  (e) => Text(
                    e.key,
                    style: textStyle,
                  ),
                )
                .toList(),
          ),
          Row(
            children: item.entries
                .map(
                  (e) => Text(
                    e.value,
                    style: textStyle,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
