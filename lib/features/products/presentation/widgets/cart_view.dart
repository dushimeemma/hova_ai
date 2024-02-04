import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/core/helpers/helpers.dart';
import 'package:hova_ai/features/products/presentation/widgets/add_button.dart';
import 'package:hova_ai/features/products/presentation/widgets/button.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart_item_view.dart';

class CartView extends StatelessWidget {
  final double width;
  final double height;
  const CartView({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    bool isDeskTop = HelperMethods.isDeskTop(width: width);
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Please review the selected products and the total amount to \n confirm the transaction...',
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
              color: isDeskTop ? Colors.white : deskTopBg,
              fontSize: width > 1200 ? 18.0 : 14.0,
            ),
          ),
          const SizedBox(height: 8),
          RoundedButton(
            bgColor: isDeskTop ? deskTopBg : Colors.white,
            borderWidth: 1,
            borderColor: isDeskTop ? Colors.white : deskTopBg,
            width: isDeskTop ? width * 0.05 : width * 0.12,
            child: Text(
              'CLEAR',
              style: TextStyle(
                color: isDeskTop ? Colors.white : deskTopBg,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Container(
              width: isDeskTop ? width * 0.3 : width * 0.8,
              height: height * 0.4,
              // padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: ListView.builder(
                itemCount: HelperMethods.getCartItems().length,
                itemBuilder: (context, index) {
                  Color rowColor = index == 7 ? scaffoldBgColor : Colors.white;
                  return CartItemView(
                    height: height,
                    width: width,
                    rowColor: rowColor,
                    idx: index,
                    item: HelperMethods.getCartItems()[index],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (isDeskTop)
            Row(
              children: <Widget>[
                RoundedButton(
                  bgColor: Colors.white,
                  borderWidth: 0,
                  borderColor: Colors.white,
                  width: (width >= 1024 && width < 13200)
                      ? width * .1
                      : width * .08,
                  child: const AddButton(label: 'CUSTOMER'),
                ),
                const SizedBox(
                  width: 8,
                ),
                RoundedButton(
                  bgColor: Colors.white,
                  borderWidth: 0,
                  borderColor: Colors.white,
                  width: (width >= 1024 && width < 13200)
                      ? width * .18
                      : width * .1,
                  child: const AddButton(label: 'PAYMENT METHOD'),
                ),
              ],
            ),
          if (!isDeskTop)
            SizedBox(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  RoundedButton(
                    bgColor: Colors.white,
                    borderWidth: 1,
                    borderColor: Colors.black,
                    width: width * .3,
                    child: const AddButton(label: 'CUSTOMER'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  RoundedButton(
                    bgColor: Colors.white,
                    borderWidth: 1,
                    borderColor: Colors.black,
                    width: width * .5,
                    child: const AddButton(label: 'PAYMENT METHOD'),
                  ),
                ],
              ),
            ),
          SizedBox(height: isDeskTop ? 124 : 24),
          if (isDeskTop)
            Row(
              children: <Widget>[
                RoundedButton(
                  bgColor: Colors.white,
                  borderWidth: 1,
                  borderColor: stockDangerColor,
                  width: width * .08,
                  child: const Text(
                    'CLEAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: stockDangerColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                RoundedButton(
                  bgColor: scaffoldBgColor,
                  borderWidth: 1,
                  borderColor: Colors.white,
                  width: width * .12,
                  child: const Text(
                    'CONFIRM TRANSACTION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          if (!isDeskTop)
            Center(
              child: RoundedButton(
                bgColor: scaffoldBgColor,
                borderWidth: 1,
                borderColor: Colors.black,
                width: width * .8,
                child: const AddButton(
                  label: 'Confirm Transaction',
                  icon: Icons.check_circle,
                  color: Colors.white,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
