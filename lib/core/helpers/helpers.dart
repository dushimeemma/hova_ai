import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';

class HelperMethods {
  static bool isDeskTop({
    required double width,
  }) {
    if (width > 1024) {
      return true;
    }
    return false;
  }

  static getNavItems({
    Color? color,
  }) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: color ?? bottomNavigationColor,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.assignment_outlined,
          color: color ?? bottomNavigationColor,
        ),
        label: 'Transactions',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.inventory_outlined,
          color: color ?? bottomNavigationColor,
        ),
        label: 'Inventory',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline,
          color: color ?? bottomNavigationColor,
        ),
        label: 'Profile',
      ),
    ];
  }

  static List<Map<String, dynamic>> getCartItems() {
    return [
      {
        "Phone Charger": "...",
      },
      {
        "QTY 1 X 1000": "1000",
      },
      {
        "Laptop Charger": "...",
      },
      {
        "QTY 1 X 1000": "1200",
      },
      {
        "Discount (10%)": "-120",
      },
      {
        "Before Disc.": "RF 2200",
      },
      {
        "Tax (18%)": "RF 374.4",
      },
      {
        "After Disc.": "RF 2080",
      },
    ];
  }

  static BoxDecoration getBodyDecoration({
    bool isDeskTop = false,
  }) {
    return BoxDecoration(
      color: isDeskTop ? dashboardTransparentBg : Colors.white,
      borderRadius: isDeskTop
          ? null
          : const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
    );
  }
}
