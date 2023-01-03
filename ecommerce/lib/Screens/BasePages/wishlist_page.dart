import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Constants/constants.dart';
import '../screens.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.05),
          child: const Center(
            child: Text(
              'Your Wishlist',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (builder, index) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
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
                                  'https://staticimg.titan.co.in/Tanishq/Catalog/50D2FFSJJAGA09_1.jpg?impolicy=pqmed&imwidth=100',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sophisticated Stud Earrings',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16.0,
                                ),
                              ),
                              const Text(
                                '50D2FFSJJAGA092BD000087',
                                style: TextStyle(
                                  color: AppColors.textGreyColor,
                                  fontSize: 14.0,
                                ),
                              ),
                              const Text(
                                '₹ 39,628',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 16.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_bag_outlined,
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
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.textGreyColor.withAlpha(30),
                      thickness: 1.5,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
