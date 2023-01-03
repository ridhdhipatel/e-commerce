import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../Screens/screens.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';
import 'BasePages/base_pages.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = PageRoutes.base;
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AdvancedDrawerController _advancedDrawerController =
      AdvancedDrawerController();
  bool isFavorite = false;
  int selectedIndex = 0;
  static const List<Widget> widgetOptions = <Widget>[
    HomePage(),
    CategoriesPage(),
    WishlistPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   if (scaffoldKey.currentState != null &&
  //       scaffoldKey.currentState!.isDrawerOpen) {
  //     _closeDrawer();
  //   }
  // }

  // @override
  // void didUpdateWidget(covariant BaseScreen oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (scaffoldKey.currentState != null &&
  //       scaffoldKey.currentState!.isDrawerOpen) {
  //     _closeDrawer();
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selectedIndex == 0) {
          exit(0);
        } else {
          setState(() {
            selectedIndex = 0;
          });
        }
        return Future.value(true);
      },
      child: AdvancedDrawer(
        backdropColor: AppColors.primaryColor,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 250),
        animateChildDecoration: true,
        rtlOpening: false,
        openRatio: 0.55,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: AppDrawer(
          // ignore: void_checks
          advancedDrawerController: _advancedDrawerController,
        ),
        child: Scaffold(
          key: scaffoldKey,
          body: Stack(
            children: [
              widgetOptions.elementAt(selectedIndex),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: _handleMenuButtonPressed,
                      icon: ValueListenableBuilder<AdvancedDrawerValue>(
                        valueListenable: _advancedDrawerController,
                        builder: (_, value, __) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? AppColors.primaryColor.withOpacity(.7)
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                value.visible ? Icons.clear : Icons.menu,
                                key: ValueKey<bool>(value.visible),
                                color: AppColors.iconColor,
                                size: 25.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: const CartWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.defaultColor,
            selectedFontSize: 13.0,
            unselectedFontSize: 11.0,
            showSelectedLabels: true,
            currentIndex: selectedIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.textGreyColor.withAlpha(90),
            type: BottomNavigationBarType.fixed,
            onTap: onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  closeDrawer() {
    if (scaffoldKey.currentState != null &&
        scaffoldKey.currentState!.isDrawerOpen) {
      _advancedDrawerController.hideDrawer();
    }
  }
}
