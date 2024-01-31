import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_state.dart';
import 'package:hova_ai/features/products/presentation/widgets/card.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart.dart';
import 'package:hova_ai/features/products/presentation/widgets/search_field.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _currentIndex = 1;
  void setCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigation(
        currentIndex: _currentIndex,
        onTap: setCurrentIndex,
      ),
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

TextStyle _buildLabelStyle() {
  return const TextStyle(color: bottomNavigationColor);
}

_buildBottomNavigation({
  required int currentIndex,
  void Function(int)? onTap,
}) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTap,
    selectedItemColor: bottomNavigationColor,
    unselectedItemColor: bottomNavigationColor,
    selectedLabelStyle: _buildLabelStyle(),
    unselectedLabelStyle: _buildLabelStyle(),
    showUnselectedLabels: true,
    selectedIconTheme: const IconThemeData(
      color: scaffoldBgColor,
    ),
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: 'Transactions',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.inventory_outlined),
        label: 'Inventory',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ],
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
