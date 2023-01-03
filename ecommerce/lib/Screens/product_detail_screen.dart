import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Helpers/helpers.dart';
import '../Models/models.dart';
import '../Providers/providers.dart';
import '../Screens/screens.dart';
import '../Constants/constants.dart';
import '../Routes/routes.dart';
import '../Widgets/widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = PageRoutes.productDetail;
  const ProductDetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductListProvider productListProvider;
  late ProductList product;
  int quantity = 1;
  bool isFavorite = false;
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    productListProvider =
        Provider.of<ProductListProvider>(context, listen: false);
    product = ProductList();
    getProduct();
  }

  getProduct() {
    product = productListProvider.getProduct(widget.id);
    if (product.image1 != null) {
      imagePaths.add(product.image1!);
    }
    if (product.image2 != null) {
      imagePaths.add(product.image2!);
    }
    if (product.image3 != null) {
      imagePaths.add(product.image3!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ImageViewerScreen.routeName,
              arguments: ImageViewerScreen(
                paths: imagePaths,
              ),
            );
          },
          child: CarouselSlider(
            items: List.generate(
              imagePaths.length,
              (index) => SizedBox(
                width: size.width,
                child: CachedNetworkImage(
                  imageUrl: imagePaths[index],
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
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // GestureDetector(
              //   onTap: () {},
              //   child: const WishlistWidget(),
              // ),
              // SizedBox(
              //   width: 10.0,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                child: const CartWidget(),
              ),
            ],
          ),
        ),
        SafeArea(
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25.0,
              color: AppColors.iconColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.65,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(12.0, size.height * 0.05, 12.0, 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.8,
                              child: Text(
                                product.name ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            CustomText(
                              text: product.productCode ?? '',
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              product.isFavorite = !product.isFavorite;
                            });
                          },
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? AppColors.countColor
                                : AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              '₹ ${NumberFormat.decimalPattern('hi').format(product.price)}',
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
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
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Total Price: ',
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomText(
                          text:
                              '₹ ${NumberFormat.decimalPattern("hi").format(product.price! * quantity)}',
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    // RatingBar.builder(
                    //   initialRating: 3.5,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemSize: 20.0,
                    //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    //   itemBuilder: (context, _) => Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //     size: 20.0,
                    //   ),
                    //   onRatingUpdate: (rating) {
                    //     print(rating);
                    //   },
                    // ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const CustomText(
                      text: 'Description',
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      product.description ?? '',
                      style: TextStyle(
                        color: Colors.blueGrey.withAlpha(90),
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: 'Purity',
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CustomText(
                              text: '${product.purity}',
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: 'Weight',
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CustomText(
                              text: '${product.weight}',
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: 'For any query?',
                          textStyle: WidgetTheme.queryTextStyle,
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            showEnquirySheet(context, size);
                          },
                          child: const CustomText(
                            text: 'Enquiry Here',
                            textStyle: WidgetTheme.enquiryTextStyle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Helpers.onShareClick(imagePaths);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.share,
                                    color: AppColors.defaultColor,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  const CustomText(
                                    text: 'Share',
                                    textStyle: WidgetTheme.buttonTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.shopping_bag,
                                  color: AppColors.defaultColor,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                const CustomText(
                                  text: 'Add To Cart',
                                  textStyle: WidgetTheme.buttonTextStyle,
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
            ),
          ),
        ),
      ],
    ));
  }

  showEnquirySheet(BuildContext context, Size size) {
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
          height: size.height * 0.2,
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
                text: 'Contact US From',
                textStyle: WidgetTheme.bottomSheetTitleTextStyle,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      launchUrl(
                        Uri(
                          scheme: 'tel',
                          path: '+91 9874563210',
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.phoneImage,
                          scale: 2.2,
                          // color: AppColors.defaultColor,
                        ),
                        const CustomText(
                          text: 'Call Us',
                          textStyle: WidgetTheme.bottomSheetDetailTextStyle,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Helpers.launchWhatsAppUri(
                        context,
                        '+91 9874563210',
                        "I have enquiry for: CODE: ${product.productCode} NAME: ${product.name}",
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.whatsappImage,
                          scale: 2.5,
                        ),
                        const CustomText(
                          text: 'Whatsapp Us',
                          textStyle: WidgetTheme.bottomSheetDetailTextStyle,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Helpers.openMail(
                          "I have enquiry for: CODE: ${product.productCode} NAME: ${product.name}",
                          'dummy.mail@gmail.com');
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.mailImage,
                          scale: 2.3,
                        ),
                        const CustomText(
                          text: 'Mail Us',
                          textStyle: WidgetTheme.bottomSheetDetailTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
