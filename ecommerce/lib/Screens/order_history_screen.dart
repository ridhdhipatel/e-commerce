import 'package:flutter/material.dart';

import '../Widgets/widgets.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';
import 'screens.dart';

class OrderHistoryScreen extends StatefulWidget {
  static const String routeName = PageRoutes.orderHistory;
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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
        title: const Text(
          'Your Orders',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              showFiltersDialog(context, size);
            },
            child: Container(
              width: 80.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.only(right: 15.0, bottom: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.textColor,
                ),
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.defaultColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppImages.filterImage,
                    scale: 3,
                    color: AppColors.textColor,
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  const CustomText(
                    text: 'Filter',
                    textStyle: WidgetTheme.normalTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (builder, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(OrderDetailScreen.routeName);
                  },
                  child: Container(
                    width: size.width * .96,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(.05),
                      border: Border.all(
                        color: AppColors.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'ON_001',
                          textStyle: WidgetTheme.orderTitleTextStyle,
                        ),
                        const CustomText(
                          text: '01-01-2023 10:15',
                          textStyle: WidgetTheme.orderDetailTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                CustomText(
                                  text: 'Total Products',
                                  textStyle: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColors.indicatorColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                CustomText(
                                  text: ' 10',
                                  textStyle: WidgetTheme.orderDetailTextStyle,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                CustomText(
                                  text: 'Status',
                                  textStyle: TextStyle(
                                    fontSize: 14.0,
                                    color: AppColors.indicatorColor,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                CustomText(
                                  text: ' Pending',
                                  textStyle: WidgetTheme.orderDetailTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  showFiltersDialog(BuildContext context, Size size) {
    showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: const Text(
            'Filter on Status',
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  'Pending',
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Approved',
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Reject',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Search',
                style: TextStyle(
                  color: AppColors.indicatorColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.errorColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
