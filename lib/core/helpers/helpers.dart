import 'package:flutter/material.dart';
import 'package:hova_ai/core/constants/constants.dart';

class HelperMethods {
  static bool isDeskTop({
    required double width,
  }) {
    if (width > 600) {
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
}
