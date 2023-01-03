import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Constants/constants.dart';
import '../Providers/providers.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';
import 'screens.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = PageRoutes.products;
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  RangeValues currentRangeValues = const RangeValues(0, 24);
  bool isFavorite = false;
  bool isCategory = false;
  bool isFilter = false;
  bool isSort = false;
  int selectedValue = 0;

  List<Widget>? dropdownItems = [
    const CustomText(
      text: 'Simple Rings',
      textStyle: WidgetTheme.bottomSheetDetailTextStyle,
    ),
    const CustomText(
      text: 'Gold Ring',
      textStyle: WidgetTheme.bottomSheetDetailTextStyle,
    ),
    const CustomText(
      text: 'Dubai Ring',
      textStyle: WidgetTheme.bottomSheetDetailTextStyle,
    ),
    const CustomText(
      text: 'Pure Gold Ring',
      textStyle: WidgetTheme.bottomSheetDetailTextStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 25.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Product',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                        child: const CartWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                // border: Border.all(
                //   color: AppColors.textGreyColor,
                //   width: 1.5,
                // ),
                color: AppColors.primaryColor.withOpacity(.2),
              ),
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: AppColors.iconColor,
                    size: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 10.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: 'Search Products...',
                        hintStyle: const TextStyle(
                          color: AppColors.textGreyColor,
                        ),
                      ),
                      cursorColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 15.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showCategoriesBottomSheet(context, size);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.defaultColor,
                        ),
                        child: const CustomText(
                          text: 'Categories',
                          textStyle: WidgetTheme.normalTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        showFiltersBottomSheet(context, size);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.textColor,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          color: AppColors.defaultColor,
                        ),
                        child: Row(
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
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.textColor,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                      color: AppColors.defaultColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.sortImage,
                          scale: 1.5,
                          color: AppColors.textColor,
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        const CustomText(
                          text: 'Sort',
                          textStyle: WidgetTheme.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ProductListProvider>(
                builder: (builder, product, child) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: size.height / 3,
                ),
                itemCount: product.productList.length,
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
        ],
      ),
    );
  }

  showCategoriesBottomSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return Container(
          height: size.height * 0.25,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: AppColors.primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Categories',
                textStyle: WidgetTheme.bottomSheetTitleTextStyle,
              ),
              const Divider(
                color: AppColors.defaultColor,
                thickness: 1.5,
              ),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dropdownItems!.length,
                  itemBuilder: (builder, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: dropdownItems![index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  showFiltersBottomSheet(BuildContext context, Size size) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: size.height * 0.25,
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: AppColors.primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Filter By Purity',
                  textStyle: WidgetTheme.bottomSheetTitleTextStyle,
                ),
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.98,
                  child: Column(
                    children: [
                      RangeSlider(
                        values: currentRangeValues,
                        activeColor: AppColors.defaultColor,
                        inactiveColor: AppColors.textGreyColor.withAlpha(50),
                        max: 24,
                        divisions: 24,
                        labels: RangeLabels(
                          currentRangeValues.start.round().toString(),
                          currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            currentRangeValues = values;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.045, right: size.width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            CustomText(
                              text: '0',
                              textStyle: WidgetTheme.bottomSheetDetailTextStyle,
                            ),
                            CustomText(
                              text: '24',
                              textStyle: WidgetTheme.bottomSheetDetailTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        text: 'Search',
                        textStyle: TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        text: 'Cancel',
                        textStyle: TextStyle(
                          color: AppColors.countColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
