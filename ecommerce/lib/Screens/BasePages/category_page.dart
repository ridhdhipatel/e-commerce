import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants/constants.dart';
import '../../Models/models.dart';
import '../../Providers/providers.dart';
import '../../Widgets/widgets.dart';
import '../screens.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesProvider categoriesProvider;
  List<Categories> categories = [];
  List<ProductCategory> productCategory = [];
  bool isExpanded = false;
  bool isSubCategoryExpanded = false;

  @override
  void initState() {
    super.initState();
    categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    getCategories();
  }

  getCategories() {
    categories = categoriesProvider.categoriesList;
  }

  getProductCategories(int categoryId) {
    productCategory = categoriesProvider.productCategories(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.05, bottom: size.height * 0.03),
          child: const Center(
            child: CustomText(
              text: 'Categories',
              textStyle: WidgetTheme.titleTextStyle,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (builder, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = true;
                  });
                  getProductCategories(categories[index].id!);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.primaryColor),
                    color: AppColors.defaultColor,
                    // image: const DecorationImage(
                    //   image: NetworkImage(
                    //       'https://media.istockphoto.com/id/535484810/photo/gold-bars-on-white-background.jpg?s=612x612&w=0&k=20&c=gmjQGSrVRRemRFl7fZrxAEH_K9j9gTJOQmlIoANc56U='),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: categories[index].name ?? '',
                    textStyle: WidgetTheme.categoryTextStyle,
                  ),
                ),
              );
            },
            itemCount: categories.length,
          ),
        ),
        // const Divider(
        //   color: AppColors.primaryColor,
        //   thickness: 0.5,
        // ),
        Visibility(
          visible: isExpanded,
          child: Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: size.height / 7,
              ),
              itemBuilder: (builder, index) {
                return CategoryCard(
                  size: size,
                  onTapped: () {
                    Navigator.of(context).pushNamed(ProductScreen.routeName);
                  },
                  imageUrl: productCategory[index].imageUrl ?? '',
                  name: productCategory[index].name ?? '',
                );
              },
              itemCount: productCategory.length,
            ),
          ),
        ),
      ],
    );
  }
}

/*
  Visibility(
                    visible: isSubCategoryExpanded,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        childAspectRatio: size.height * 0.2 / size.width,
                        mainAxisExtent: size.height * 0.15,
                      ),
                      itemCount: 6,
                      itemBuilder: (builder, inder) {
                        return Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                margin: const EdgeInsets.all(5.0),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://www.kalyanjewellers.net/images/Jewellery/Gold/images/LAV-GOLD-BAND.jpg',
                                  errorWidget: (context, url, error) {
                                    return const Icon(Icons.error_outline);
                                  },
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                child: Container(
                                  height: size.height * 0.03,
                                  width: size.width * 0.25,
                                  padding: const EdgeInsets.all(2.0),
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.30),
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(2.0),
                                      bottomRight: Radius.circular(2.0),
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Gold',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isSubCategoryExpanded =
                                                !isSubCategoryExpanded;
                                          });
                                        },
                                        child: Icon(
                                          isSubCategoryExpanded
                                              ? Icons.keyboard_arrow_up_rounded
                                              : Icons
                                                  .keyboard_arrow_down_rounded,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
 */
