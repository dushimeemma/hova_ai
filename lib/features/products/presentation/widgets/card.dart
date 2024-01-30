import 'package:flutter/material.dart';
import 'package:hova_ai/features/products/domain/entities/product.dart';
import 'package:hova_ai/features/products/presentation/widgets/button.dart';

class RoundedOutlineCard extends StatelessWidget {
  final ProductEntity product;
  const RoundedOutlineCard({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Colors.grey),
      ),
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          _paddingWrapper(
            children: <Widget>[
              _buildRow(
                quantity: product.quantity!,
                name: product.name!,
              ),
              const RoundedButton(),
            ],
          ),
          _buildDivider(),
          _paddingWrapper(
            children: <Widget>[
              const Text('Item 3'),
              const Text('Item 4'),
            ],
          ),
        ],
      ),
    );
  }
}

Row _buildRow({
  required int quantity,
  required String name,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            '$quantity',
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(width: 8.0), // Add space between the two widgets
      Text(
        name,
        style: const TextStyle(fontSize: 16.0),
      ),
    ],
  );
}

Divider _buildDivider() {
  return const Divider(
    color: Colors.grey,
    thickness: 1.0,
    height: 20.0,
  );
}

Padding _paddingWrapper({
  required List<Widget> children,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}
