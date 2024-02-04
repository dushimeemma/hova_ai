import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hova_ai/core/helpers/helpers.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isDeskTop = HelperMethods.isDeskTop(width: width);
    return !isDeskTop
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'confirm transaction'.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'HOVA',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(isDeskTop ? .0 : 16.0),
              width: double.infinity,
              decoration: HelperMethods.getBodyDecoration(isDeskTop: isDeskTop),
              child: CartView(width: width, height: height),
            ),
          )
        : const SizedBox();
  }
}
