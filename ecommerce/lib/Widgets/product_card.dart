import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/constants.dart';
import '../Widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.size,
    required this.icon,
    required this.onFavorite,
    required this.isNew,
    required this.discount,
  });

  final String imageUrl;
  final String productName;
  final double price;
  final Size size;
  final Widget icon;
  final Function onFavorite;
  final bool isNew;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.45,
      child: Card(
        elevation: 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              clipBehavior: Clip.antiAlias,
              children: [
                Image(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                  height: size.height * 0.322,
                  width: size.width,
                ),
                IconButton(
                  onPressed: () {
                    onFavorite();
                  },
                  icon: icon,
                ),
                Visibility(
                    visible: isNew,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: size.width * .15,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          color: AppColors.errorColor,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5.0),
                        margin: const EdgeInsets.only(left: 0.0, top: 5.0),
                        child: const Text(
                          'New',
                          style: TextStyle(
                            color: AppColors.defaultColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Container(
                    // height: size.height * 0.07,
                    width: size.width * 0.45,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: productName,
                          textStyle: WidgetTheme.cardTextStyle,
                        ),
                        SizedBox(
                          height: size.height * 0.005,
                        ),
                        Visibility(
                          visible: discount == 0,
                          child: CustomText(
                            text:
                                '₹ ${NumberFormat.decimalPattern('hi').format(price)}',
                            textStyle: WidgetTheme.cardTextStyle,
                          ),
                        ),
                        Visibility(
                          visible: discount != 0,
                          child: Row(
                            children: [
                              CustomText(
                                text:
                                    '₹ ${NumberFormat.decimalPattern('hi').format(price - ((price * discount) / 100))} /',
                                textStyle: WidgetTheme.cardTextStyle,
                              ),
                              CustomText(
                                text: NumberFormat.decimalPattern('hi')
                                    .format(price),
                                textStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: AppColors.errorColor,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decorationThickness: 4.0,
                                  fontSize: 11.0,
                                  letterSpacing: 0.5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: size.width * .02,
                              ),
                              CustomText(
                                text: '$discount%',
                                textStyle: const TextStyle(
                                  color: AppColors.defaultColor,
                                  decorationThickness: 3.0,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
