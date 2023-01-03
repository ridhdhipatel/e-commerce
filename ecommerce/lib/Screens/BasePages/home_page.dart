import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Constants/constants.dart';
import '../../Providers/providers.dart';
import '../../Widgets/widgets.dart';
import '../screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer<SliderProvider>(builder: (context, sliders, child) {
            return CarouselSlider(
              items: List.generate(
                sliders.sliderImagesList.length,
                (index) => SizedBox(
                  width: size.width,
                  child: CachedNetworkImage(
                    imageUrl: sliders.sliderImagesList[index].imageUrl!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              options: CarouselOptions(
                height: size.height * 0.45,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                // enlargeCenterPage: true,
                // enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Latest Designs',
                  textStyle: WidgetTheme.titleTextStyle,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ProductScreen.routeName);
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 3,
            width: size.width * 0.98,
            child: Consumer<ProductListProvider>(
                builder: (builder, product, child) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: product.productList.take(4).length,
                itemBuilder: (builder, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: ProductDetailScreen(
                          id: product.productList[index].id ?? 0,
                        ),
                      );
                    },
                    child: ProductCard(
                      imageUrl: product.productList[index].imageUrl ?? '',
                      productName: product.productList[index].name ?? '',
                      isNew: product.productList[index].isNew!,
                      price: product.productList[index].price ?? 0,
                      discount: product.productList[index].discount ?? 0,
                      size: size,
                      icon: Icon(
                        product.productList[index].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: product.productList[index].isFavorite
                            ? Colors.red
                            : Colors.black,
                        size: 20.0,
                      ),
                      onFavorite: () {
                        setState(() {
                          product.productList[index].isFavorite =
                              !product.productList[index].isFavorite;
                        });
                      },
                    ),
                  );
                },
              );
            }),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const CustomText(
          //         text: 'Best Seller',
          //         textStyle: WidgetTheme.titleTextStyle,
          //       ),
          //       TextButton(
          //         onPressed: () {
          //           Navigator.of(context).pushNamed(ProductScreen.routeName);
          //         },
          //         child: const Text(
          //           'View All',
          //           style: TextStyle(
          //             color: AppColors.primaryColor,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: size.height / 3,
          //   width: size.width * 0.98,
          //   child: Consumer<ProductListProvider>(
          //       builder: (builder, product, child) {
          //     return ListView.builder(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: product.productList.take(4).length,
          //       itemBuilder: (builder, index) {
          //         return GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).pushNamed(
          //               ProductDetailScreen.routeName,
          //               arguments: const ProductDetailScreen(
          //                 id: 1,
          //               ),
          //             );
          //           },
          //           child: ProductCard(
          //             imageUrl: product.productList[index].imageUrl ?? '',
          //             productName: product.productList[index].name ?? '',
          //             price:
          //                 '₹ ${NumberFormat.decimalPattern('hi').format(product.productList[index].price ?? 0)}',
          //             size: size,
          //             icon: Icon(
          //               product.productList[index].isFavorite
          //                   ? Icons.favorite
          //                   : Icons.favorite_outline,
          //               color: product.productList[index].isFavorite
          //                   ? Colors.red
          //                   : Colors.black,
          //               size: 20.0,
          //             ),
          //             onFavorite: () {
          //               setState(() {
          //                 product.productList[index].isFavorite =
          //                     !product.productList[index].isFavorite;
          //               });
          //             },
          //           ),
          //         );
          //       },
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
}
