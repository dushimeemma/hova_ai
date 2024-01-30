import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hova_ai/config/theme/app_theme.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_event.dart';
import 'package:hova_ai/features/products/presentation/pages/home/products.dart';
import 'package:hova_ai/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => sl()..add(const GetProducts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Products(),
        theme: theme(),
      ),
    );
  }
}
