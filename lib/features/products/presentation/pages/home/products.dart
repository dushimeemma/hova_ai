import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/core/helpers/helpers.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_state.dart';
import 'package:hova_ai/features/products/presentation/widgets/card.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart.dart';
import 'package:hova_ai/features/products/presentation/widgets/search_field.dart';
import 'package:hovering/hovering.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _currentIndex = 1;
  bool isHovered = false;
  void setCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onHover(event) {
    setState(() {
      isHovered = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: !HelperMethods.isDeskTop(width: width) ? _buildAppBar() : null,
      body: !HelperMethods.isDeskTop(width: width)
          ? _buildMobileBody()
          : _buildDeskTopBody(
              width: width,
              height: height,
              onHover: onHover,
              isHovered: isHovered,
            ),
      bottomNavigationBar: !HelperMethods.isDeskTop(width: width)
          ? _buildBottomNavigation(
              currentIndex: _currentIndex,
              onTap: setCurrentIndex,
            )
          : null,
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
    items: HelperMethods.getNavItems(
      color: bottomNavigationColor,
    ),
  );
}

Widget _buildMobileBody() {
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

Widget _buildLogo({
  required double height,
}) {
  return Container(
    width: double.infinity,
    height: height * .1,
    color: scaffoldBgColor,
    alignment: Alignment.center,
    child: Text(
      'HOVASTORE'.toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Container _buildItemContainer({
  required int index,
  Color? color,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: color ?? deskTopBg,
      border: const Border(
        bottom: BorderSide(
          color: bottomNavigationColor,
          width: 1.0,
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        HelperMethods.getNavItems()[index].icon,
        Text(
          HelperMethods.getNavItems()[index].label!.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: bottomNavigationColor,
          ),
        ),
      ],
    ),
  );
}

Widget _buildNavItems({
  void Function()? onTap,
  required void Function(PointerEnterEvent) onHover,
  required bool isHovered,
}) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: HelperMethods.getNavItems().length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: onTap,
        child: HoverWidget(
          hoverChild: _buildItemContainer(
            index: index,
            color: Colors.black,
          ),
          onHover: onHover,
          child: _buildItemContainer(index: index),
        ),
      );
    },
  );
}

Widget _buildPoweredBy() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'Powered by \n HOVA AI',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

Widget _buildDeskTopBody({
  required double width,
  required double height,
  required void Function(PointerEnterEvent) onHover,
  required bool isHovered,
}) {
  return SizedBox(
    width: width * 0.1,
    height: height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildLogo(height: height),
            _buildNavItems(onHover: onHover, isHovered: isHovered),
          ],
        ),
        _buildPoweredBy(),
      ],
    ),
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
