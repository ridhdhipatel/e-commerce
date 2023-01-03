import 'package:flutter/material.dart';

import '../Widgets/widgets.dart';
import '../Constants/constants.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({super.key});

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, top: 5.0),
      child: Column(
        children: [
          Visibility(
            visible: true, //value.cartItemCount > 0,
            child: Container(
              height: 17.0,
              width: 17.0,
              decoration: const BoxDecoration(
                color: AppColors.countColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const CustomText(
                text: '0',
                // text: value.cartItemCount.toString(),
                textStyle: WidgetTheme.cardTextStyle,
              ),
            ),
          ),
          const Align(
            child: Icon(
              Icons.favorite,
              color: AppColors.primaryColor,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
