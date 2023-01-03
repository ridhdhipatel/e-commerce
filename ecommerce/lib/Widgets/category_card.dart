import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../Widgets/widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.size,
    required this.name,
    required this.imageUrl,
    required this.onTapped,
  }) : super(key: key);

  final Size size;
  final String name;
  final String imageUrl;
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(7.0),
            elevation: 7.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: size.height * 0.1,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: CustomText(
              text: name,
              textStyle: WidgetTheme.categoryTextStyle,
              testAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
