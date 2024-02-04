import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/core/helpers/helpers.dart';
import 'package:hova_ai/features/products/domain/entities/product.dart';
import 'package:hova_ai/features/products/presentation/widgets/button.dart';

class RoundedOutlineCard extends StatelessWidget {
  final ProductEntity product;
  final double width;
  const RoundedOutlineCard({
    super.key,
    required this.product,
    required this.width,
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
                width: width,
                quantity: product.quantity!,
                name: product.name!,
              ),
              const RoundedButton(),
            ],
          ),
          _buildDivider(),
          _paddingWrapper(
            padding: (width > 1063 && width < 1437) ? 4.0 : 12.0,
            children: <Widget>[
              _buildTextPrice(product: product),
              _buildCart(
                width: width,
                quantity: product.quantity!,
                isAddedToCart: product.quantity! == 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Text _buildTextColor({
  Color? color,
  required String label,
}) {
  return Text(
    label,
    style: TextStyle(
      color: color ?? stockColorPrimary,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
  );
}

Widget _buildCart({
  required int quantity,
  bool isAddedToCart = false,
  required double width,
}) {
  if (isAddedToCart) {
    return _buildTextColor(label: 'Already added');
  }
  if (quantity == 0) {
    return _buildTextColor(
      label: 'Out of stock',
      color: stockDangerColor,
    );
  }
  return RoundedButton(
    bgColor: scaffoldBgColor,
    width: HelperMethods.isDeskTop(width: width) ? width * .05 : width * 0.25,
    child: Text(
      'add to cart'.toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 8,
      ),
    ),
  );
}

Text _buildTextPrice({required ProductEntity product}) {
  return Text(
    '${product.currencyCode} ${product.price}'.toUpperCase(),
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );
}

Color _calculateColorByValue({required int value}) {
  if (value >= 50) {
    return stockSuccessColor;
  }
  if (value > 0) {
    return stockDarkColor;
  }
  if (value == 0) {
    return stockDangerColor;
  }
  return stockSuccessColor;
}

Container _buildQuantityContainer({
  required int quantity,
}) {
  return Container(
    width: 40.0,
    height: 40.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: _calculateColorByValue(value: quantity),
        width: 2.0,
      ),
    ),
    child: Center(
      child: Text(
        '$quantity',
        style: TextStyle(
          color: _calculateColorByValue(value: quantity),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Row _buildRow({
  required int quantity,
  required String name,
  required double width,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildQuantityContainer(quantity: quantity),
      const SizedBox(width: 8.0),
      SizedBox(
        width: width >= 1437
            ? width * 0.14
            : (width > 1024 && width < 1437)
                ? width * 0.1
                : width * 0.5,
        child: Text(
          name,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextStyle(fontSize: 16.0),
        ),
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
  double? padding,
}) {
  return Padding(
    padding: EdgeInsets.all(padding ?? 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    ),
  );
}
