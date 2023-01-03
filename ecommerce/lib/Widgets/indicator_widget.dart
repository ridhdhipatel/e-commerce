import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({
    super.key,
    required this.currentIndex,
    required this.positionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: positionIndex == currentIndex ? 20 : 12,
      width: positionIndex == currentIndex ? 20 : 12,
      decoration: BoxDecoration(
        // border: Border.all(color: AppColors.indicatorColor),
        color: positionIndex == currentIndex
            ? AppColors.primaryColor
            : AppColors.textGreyColor.withAlpha(70),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
