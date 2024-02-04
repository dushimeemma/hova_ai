import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hova_ai/features/products/presentation/pages/cart/cart.dart';
import 'package:hova_ai/features/products/presentation/pages/home/products.dart';

class AppRoutes {
  static Map<String, dynamic> routesData = {
    "routes": <RouteBase>[
      GoRoute(
        name: '/',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Products();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'cart',
            path: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const CartPage();
            },
          ),
        ],
      ),
    ],
  };
}
