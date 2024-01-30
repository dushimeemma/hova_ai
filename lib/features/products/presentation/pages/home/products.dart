import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_state.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Products',
        ),
      ),
      body: _buildBody(),
    );
  }
}

_buildBody() {
  return BlocBuilder<ProductsBloc, ProductState>(
    builder: (_, state) {
      if (state is ProductsLoadingState) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is ProductsError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is ProductsDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Text(state.products![index].name!);
          },
          itemCount: state.products!.length,
        );
      }
      return const SizedBox();
    },
  );
}
