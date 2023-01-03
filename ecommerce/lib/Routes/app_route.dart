import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../Screens/screens.dart';

class AppRoutes {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case BaseScreen.routeName:
        return PageTransition(
          child: const BaseScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case IntroductionJewelleryScreen.routeName:
        return PageTransition(
          child: const IntroductionJewelleryScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );

      case ContactScreen.routeName:
        return PageTransition(
          child: const ContactScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case FeedbackScreen.routeName:
        return PageTransition(
          child: const FeedbackScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );

      case CatalogScreen.routeName:
        return PageTransition(
          child: const CatalogScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case ProductDetailScreen.routeName:
        var args = settings.arguments as ProductDetailScreen;
        return PageTransition(
          child: ProductDetailScreen(
            id: args.id,
          ),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case LoginScreen.routeName:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case ProfileScreen.routeName:
        return PageTransition(
          child: const ProfileScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case OrderHistoryScreen.routeName:
        return PageTransition(
          child: const OrderHistoryScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case ProductScreen.routeName:
        // var args = settings.arguments as ProductScreen;
        return PageTransition(
          child: const ProductScreen(
              // subCategoryId: args.subCategoryId,
              // subCategoryName: args.subCategoryName,
              ),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );

      case ImageViewerScreen.routeName:
        var args = settings.arguments as ImageViewerScreen;
        return PageTransition(
          child: ImageViewerScreen(
            paths: args.paths,
          ),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      case CartScreen.routeName:
        return PageTransition(
          child: const CartScreen(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );

      case OrderDetailScreen.routeName:
        // var args = settings.arguments as OrderDetailScreen;
        return PageTransition(
          child: const OrderDetailScreen(
              // orderNumber: args.orderNumber,
              // flag: args.flag,
              ),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
      default:
        return PageTransition(
          child: const ErrorScreen(),
          type: PageTransitionType.leftToRight,
          duration: const Duration(milliseconds: 300),
          reverseDuration: const Duration(milliseconds: 300),
        );
    }
  }
}
