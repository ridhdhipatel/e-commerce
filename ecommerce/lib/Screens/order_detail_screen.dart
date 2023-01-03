import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Constants/constants.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = PageRoutes.orderDetail;
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 25.0,
            color: AppColors.textColor,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: size.width * .96,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: AppColors.primaryColor, width: .7),
                color: AppColors.textGreyColor.withOpacity(.05),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: const [
                      CustomText(
                        text: 'Order Number: ',
                        textStyle: WidgetTheme.orderDetailsTitleTextStyle,
                      ),
                      CustomText(
                        text: 'SL001',
                        textStyle: WidgetTheme.orderDetailsDetailTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      CustomText(
                        text: 'Name: ',
                        textStyle: WidgetTheme.orderDetailsTitleTextStyle,
                      ),
                      CustomText(
                        text: 'Alexa',
                        textStyle: WidgetTheme.orderDetailsDetailTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      CustomText(
                        text: 'Number: ',
                        textStyle: WidgetTheme.orderDetailsTitleTextStyle,
                      ),
                      CustomText(
                        text: '+91 9630258741',
                        textStyle: WidgetTheme.orderDetailsDetailTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      CustomText(
                        text: 'Date: ',
                        textStyle: WidgetTheme.orderDetailsTitleTextStyle,
                      ),
                      CustomText(
                        text: '01-01-2023 10:15',
                        textStyle: WidgetTheme.orderDetailsDetailTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.textGreyColor.withAlpha(30),
            thickness: 1.5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Products',
              style: WidgetTheme.orderTitleTextStyle,
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (builder, index) {
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: size.height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              // border: Border.all(
                              //   width: 1.0,
                              //   color: AppColors.primaryColor,
                              // ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFSJJAGA09_1.jpg?impolicy=pqmed&imwidth=100',
                              // placeholder: (context, url) =>
                              //     Image.asset(AppImages.noImage),
                              // errorWidget: (context, url, error) =>
                              //     Image.asset(AppImages.noImage),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          SizedBox(
                            height: size.height * 0.12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: const [
                                    CustomText(
                                      text: 'Name: ',
                                      textStyle: WidgetTheme
                                          .orderDetailsTitleTextStyle,
                                    ),
                                    CustomText(
                                      text: 'Earing',
                                      textStyle: WidgetTheme
                                          .orderDetailsDetailTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    CustomText(
                                      text: 'Quantity: ',
                                      textStyle: WidgetTheme
                                          .orderDetailsTitleTextStyle,
                                    ),
                                    CustomText(
                                      text: '1',
                                      textStyle: WidgetTheme
                                          .orderDetailsDetailTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const CustomText(
                                      text: 'Price: ',
                                      textStyle: WidgetTheme
                                          .orderDetailsTitleTextStyle,
                                    ),
                                    CustomText(
                                      text:
                                          '₹ ${NumberFormat.decimalPattern('hi').format(39628)}',
                                      textStyle: WidgetTheme
                                          .orderDetailsDetailTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const CustomText(
                                      text: 'Total Price: ',
                                      textStyle: WidgetTheme
                                          .orderDetailsTitleTextStyle,
                                    ),
                                    CustomText(
                                      text:
                                          '₹ ${NumberFormat.decimalPattern('hi').format(39628)}',
                                      textStyle: WidgetTheme
                                          .orderDetailsDetailTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.textGreyColor.withAlpha(30),
                        thickness: 1.5,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
