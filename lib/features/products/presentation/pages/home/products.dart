import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hova_ai/core/constants/constants.dart';
import 'package:hova_ai/core/helpers/helpers.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_bloc.dart';
import 'package:hova_ai/features/products/presentation/bloc/product_state.dart';
import 'package:hova_ai/features/products/presentation/widgets/button.dart';
import 'package:hova_ai/features/products/presentation/widgets/card.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart.dart';
import 'package:hova_ai/features/products/presentation/widgets/cart_view.dart';
import 'package:hova_ai/features/products/presentation/widgets/icon_button.dart';
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
      appBar: !HelperMethods.isDeskTop(width: width)
          ? _buildAppBar(
              context: context,
            )
          : null,
      body: !HelperMethods.isDeskTop(width: width)
          ? _buildMobileBody(
              width: width,
            )
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

_buildAppBar({
  required BuildContext context,
}) {
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
    actions: <Widget>[
      CustomCart(
        onTap: () => context.pushNamed('cart'),
      )
    ],
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

Widget _buildMobileBody({
  bool isDeskTop = false,
  required double width,
}) {
  return BlocBuilder<ProductsBloc, ProductState>(
    builder: (_, state) {
      if (state is ProductsLoadingState) {
        return Center(
          child: CupertinoActivityIndicator(
            color: isDeskTop ? scaffoldBgColor : Colors.white,
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
          padding: EdgeInsets.all(isDeskTop ? .0 : 16.0),
          decoration: HelperMethods.getBodyDecoration(isDeskTop: isDeskTop),
          child: isDeskTop
              ? GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio:
                      (width > 1024 && width <= 1140) ? (1 / .74) : (1 / .6),
                  shrinkWrap: true,
                  children: List.generate(
                    state.products!.length,
                    (index) {
                      return RoundedOutlineCard(
                        width: width,
                        product: state.products![index],
                      );
                    },
                  ),
                )
              : Column(
                  children: <Widget>[
                    const SearchTextField(),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return RoundedOutlineCard(
                            product: state.products![index],
                            width: width,
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

Widget _buildSidebar({
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

Widget _buildHovaAppBarItem() {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 12.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundedButton(
          borderWidth: 0,
          borderColor: Colors.white,
          bgColor: scaffoldBgColor.withOpacity(0.1),
          child: const Icon(
            Icons.store,
            color: scaffoldBgColor,
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          'HOVA STORE LTD',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildUserInfo() {
  return const Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.person),
      SizedBox(width: 10),
      Text(
        'Emmanuel Dushime',
        style: TextStyle(fontSize: 16),
      ),
    ],
  );
}

Widget _buildAppBarUserProfileInfo() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildUserInfo(),
        const SizedBox(width: 20),
        const CustomIconButton(),
      ],
    ),
  );
}

Widget _buildDeskTopAppBar({
  required double height,
}) {
  return Container(
    width: double.infinity,
    height: height * .1,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildHovaAppBarItem(),
        _buildAppBarUserProfileInfo(),
      ],
    ),
  );
}

Widget _buildDashboardFistRow({
  required double height,
  required double width,
}) {
  return Container(
    color: dashboardTransparentBg,
    width: (width - (width * 0.1)) * 0.5,
    height: height - (height * 0.1),
    padding: const EdgeInsets.all(12),
    child: Column(
      children: <Widget>[
        const SearchTextField(
          showSuffix: false,
          hint: 'Search by name / barcode',
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: _buildMobileBody(
            isDeskTop: true,
            width: width,
          ),
        )
      ],
    ),
  );
}

Widget _buildDashboardContent({
  required double height,
  required double width,
}) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildDashboardFistRow(height: height, width: width),
        CartView(width: width, height: height),
      ],
    ),
  );
}

Widget _buildDesktopDashboard({
  required double width,
  required double height,
}) {
  return SizedBox(
    width: width - (width * 0.1),
    height: height,
    child: Column(
      children: <Widget>[
        _buildDeskTopAppBar(height: height),
        _buildDashboardContent(height: height, width: width),
      ],
    ),
  );
}

Widget _buildDeskTopBody({
  required double width,
  required double height,
  required void Function(PointerEnterEvent) onHover,
  required bool isHovered,
}) {
  return Row(
    children: <Widget>[
      _buildSidebar(
        width: width,
        height: height,
        onHover: onHover,
        isHovered: isHovered,
      ),
      _buildDesktopDashboard(
        width: width,
        height: height,
      ),
    ],
  );
}
