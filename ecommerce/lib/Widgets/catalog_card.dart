import 'package:flutter/material.dart';

import '../Constants/constants.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.productName,
    required this.onDownload,
  });

  final Size size;
  final String imageUrl;
  final String productName;
  final Function onDownload;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.45,
      child: Card(
        elevation: 5.0,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            productName,
                            style: WidgetTheme.cardTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onDownload();
                          },
                          child: const Icon(
                            Icons.picture_as_pdf,
                            color: AppColors.primaryColor,
                            size: 22.0,
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
