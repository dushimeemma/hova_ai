import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hova_ai/config/routes/routes.dart';
import 'package:hova_ai/config/theme/app_theme.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_event.dart';
import 'package:hova_ai/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: AppRoutes.routesData['routes'],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<ProductsBloc>(
      create: (context) => sl()..add(const GetProducts()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: theme(width: width),
      ),
    );
  }
}
