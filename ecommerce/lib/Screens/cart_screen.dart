import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Screens/screens.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = PageRoutes.cart;
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
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
              'Your Cart Items',
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
            children: [
              Container(
                width: size.width * 0.9,
                padding: const EdgeInsets.all(10.0),
                margin: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.05),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: AppColors.primaryColor.withOpacity(0.25),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_bag,
                      color: AppColors.primaryColor,
                      size: 30.0,
                    ),
                    CustomText(
                      text: 'You have 4 items in your Cart',
                      textStyle: WidgetTheme.cartCountTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (builder, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            ProductDetailScreen.routeName,
                            arguments: const ProductDetailScreen(id: 1),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * .15,
                                  width: size.width * .3,
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://staticimg.titan.co.in/Tanishq/Catalog/51F2ATXABAAA00_1.jpg?impolicy=pqmed&imwidth=100',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Goddess Lakshmi Motif 22 Karat Gold Coin',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      const Text(
                                        '51F2ATXABAAA002EA000070',
                                        style: TextStyle(
                                          color: AppColors.textGreyColor,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      const Text(
                                        '₹ 1,25,000',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    quantity++;
                                                  });
                                                },
                                                icon: const Icon(Icons.add),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              CustomText(
                                                text: '$quantity',
                                                textStyle: const TextStyle(
                                                  color: AppColors.textColor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  if (quantity > 1) {
                                                    setState(() {
                                                      quantity--;
                                                    });
                                                  }
                                                },
                                                icon: const Icon(Icons.remove),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.favorite_border,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Image.asset(
                                                  AppImages.deleteImage,
                                                  scale: 3.0,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),
                                            ],
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
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.15,
                padding: const EdgeInsets.all(15.0),
                color: AppColors.defaultColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CustomText(
                          text: 'Total',
                          textStyle: TextStyle(
                            color: AppColors.textGreyColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomText(
                          text: '₹ 15,200',
                          textStyle: TextStyle(
                            color: AppColors.textGreyColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            isLoading = false;
                          });
                          showOrderPlaceDialog(context, size);
                        });
                      },
                      child: Container(
                        width: size.width * 0.7,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: 'Place Order',
                          textStyle: WidgetTheme.buttonTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        CommonLoaderOverlay(visibile: isLoading),
      ],
    );
  }

  showOrderPlaceDialog(BuildContext context, Size size) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return AlertDialog(
            title: Text('Order Placed'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Order Number'),
                Text('SL0001'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(BaseScreen.routeName);
                },
                child: Text('Back to Home'),
              ),
            ],
          );
        });
  }
}
