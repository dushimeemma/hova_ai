import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_state.dart';
import 'package:hova_ai/features/products/presentation/widgets/card.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart.dart';
import 'package:hova_ai/features/products/presentation/widgets/search_field.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

_buildAppBar() {
  return AppBar(
    centerTitle: true,
    leading: const IconButton(
      onPressed: null,
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    title: Text(
      'new transaction'.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: const <Widget>[CustomCart()],
  );
}

_buildBody() {
  return BlocBuilder<ProductsBloc, ProductState>(
    builder: (_, state) {
      if (state is ProductsLoadingState) {
        return const Center(
          child: CupertinoActivityIndicator(
            color: Colors.white,
          ),
        );
      }
      if (state is ProductsError) {
        return const Center(
          child: Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        );
      }
      if (state is ProductsDone) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: _buildBoxDecoration(),
          child: Column(
            children: <Widget>[
              const SearchTextField(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return RoundedOutlineCard(
                      product: state.products![index],
                    );
                  },
                  itemCount: state.products!.length,
                ),
              ),
            ],
          ),
        );
      }
      return const SizedBox();
    },
  );
}

BoxDecoration _buildBoxDecoration() {
  return const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
  );
}
