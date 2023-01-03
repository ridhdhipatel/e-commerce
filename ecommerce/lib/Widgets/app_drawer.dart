import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../Screens/screens.dart';
import '../Utils/utils.dart';
import '../Widgets/widgets.dart';
import '../Constants/constants.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    Key? key,
    required this.advancedDrawerController,
  }) : super(key: key);

  final AdvancedDrawerController advancedDrawerController;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isLogin = false;
  bool isHomeSelect = true;
  bool isCatalogSelect = false;
  bool isOrderHistorySelect = false;
  bool isContactSelect = false;
  bool isFeedbackSelect = false;
  bool isProfileSelect = false;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: AppColors.defaultColor,
      iconColor: AppColors.defaultColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SafeArea(
            child: Container(
              width: 128.0,
              height: 128.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 20.0,
              ),
              child: Image.asset(AppImages.drawerImage),
            ),
          ),
          const Divider(
            color: AppColors.iconColor,
            thickness: 1.0,
          ),
          // Visibility(
          //   visible: !isLogin,
          //   child: ListTile(
          //     onTap: () {
          //       // setState(() {
          //       //   isHomeSelect = true;
          //       //   isCatalogSelect = false;
          //       //   isOrderHistorySelect = false;
          //       // });
          //     },
          //     leading: const Icon(Icons.login),
          //     title: const CustomText(
          //       text: 'Login',
          //       textStyle: WidgetTheme.buttonTextStyle,
          //     ),
          //   ),
          // ),
          ListTile(
            onTap: () {
              setState(() {
                isHomeSelect = true;
                isCatalogSelect = false;
                isOrderHistorySelect = false;
                isContactSelect = false;
                isFeedbackSelect = false;
                isProfileSelect = false;
              });
              Navigator.of(context).pushNamed(BaseScreen.routeName);
            },
            leading: Icon(
              Icons.home,
              color:
                  isHomeSelect ? AppColors.textColor : AppColors.defaultColor,
            ),
            title: CustomText(
              text: 'Home',
              textStyle: isHomeSelect
                  ? WidgetTheme.selectedButtonTextStyle
                  : WidgetTheme.buttonTextStyle,
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                isHomeSelect = false;
                isCatalogSelect = true;
                isOrderHistorySelect = false;
                isContactSelect = false;
                isFeedbackSelect = false;
                isProfileSelect = false;
              });
              Navigator.of(context)
                  .pushNamed(CatalogScreen.routeName)
                  .then((value) => setState(() {
                        isHomeSelect = true;
                        isCatalogSelect = false;
                      }));
              widget.advancedDrawerController.hideDrawer();
            },
            leading: Icon(
              Icons.picture_as_pdf,
              color: isCatalogSelect
                  ? AppColors.textColor
                  : AppColors.defaultColor,
            ),
            title: CustomText(
              text: 'Catalog',
              textStyle: isCatalogSelect
                  ? WidgetTheme.selectedButtonTextStyle
                  : WidgetTheme.buttonTextStyle,
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                isHomeSelect = false;
                isCatalogSelect = false;
                isOrderHistorySelect = true;
                isContactSelect = false;
                isFeedbackSelect = false;
                isProfileSelect = false;
              });
              Navigator.of(context)
                  .pushNamed(OrderHistoryScreen.routeName)
                  .then((value) => setState(() {
                        isHomeSelect = true;
                        isOrderHistorySelect = false;
                      }));
              widget.advancedDrawerController.hideDrawer();
            },
            leading: Icon(
              Icons.history,
              color: isOrderHistorySelect
                  ? AppColors.textColor
                  : AppColors.defaultColor,
            ),
            title: CustomText(
              text: 'Order History',
              textStyle: isOrderHistorySelect
                  ? WidgetTheme.selectedButtonTextStyle
                  : WidgetTheme.buttonTextStyle,
              overflow: TextOverflow.visible,
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                isHomeSelect = false;
                isCatalogSelect = false;
                isOrderHistorySelect = false;
                isContactSelect = true;
                isFeedbackSelect = false;
                isProfileSelect = false;
              });
              Navigator.of(context)
                  .pushNamed(ContactScreen.routeName)
                  .then((value) => setState(() {
                        isHomeSelect = true;
                        isContactSelect = false;
                      }));
              widget.advancedDrawerController.hideDrawer();
            },
            leading: Icon(
              Icons.call,
              color: isContactSelect
                  ? AppColors.textColor
                  : AppColors.defaultColor,
            ),
            title: CustomText(
              text: 'Contact',
              textStyle: isContactSelect
                  ? WidgetTheme.selectedButtonTextStyle
                  : WidgetTheme.buttonTextStyle,
              overflow: TextOverflow.visible,
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                isHomeSelect = false;
                isCatalogSelect = false;
                isOrderHistorySelect = false;
                isContactSelect = false;
                isFeedbackSelect = true;
                isProfileSelect = false;
              });
              Navigator.of(context)
                  .pushNamed(FeedbackScreen.routeName)
                  .then((value) => setState(() {
                        isHomeSelect = true;
                        isFeedbackSelect = false;
                      }));
              widget.advancedDrawerController.hideDrawer();
            },
            leading: Icon(
              Icons.feedback_rounded,
              color: isFeedbackSelect
                  ? AppColors.textColor
                  : AppColors.defaultColor,
            ),
            title: CustomText(
              text: 'Feedback',
              textStyle: isFeedbackSelect
                  ? WidgetTheme.selectedButtonTextStyle
                  : WidgetTheme.buttonTextStyle,
              overflow: TextOverflow.visible,
            ),
          ),

          Visibility(
            visible: true,
            child: ListTile(
              onTap: () {
                Shared shared = Shared();
                shared.clear();
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
              leading: const Icon(Icons.logout),
              title: const CustomText(
                text: 'Logout',
                textStyle: WidgetTheme.buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
