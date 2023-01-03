import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../Constants/constants.dart';
import '../Routes/routes.dart';

class ImageViewerScreen extends StatefulWidget {
  static const String routeName = PageRoutes.imageViewer;
  const ImageViewerScreen({
    super.key,
    required this.paths,
  });

  final List<String> paths;

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  late PageController _pageController;
  int selectedPage = 0;

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  void pageChanged(int currentPage) {
    setState(() {
      selectedPage = currentPage;
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: selectedPage,
    );

    if (!mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.defaultColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.textColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Flexible(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (currentPage) => pageChanged(currentPage),
                itemCount: widget.paths.length,
                itemBuilder: (builder, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.textColor.withAlpha(25),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: PhotoView(
                      backgroundDecoration: const BoxDecoration(
                        color: AppColors.defaultColor,
                      ),
                      // maxScale: 1.0,
                      imageProvider: NetworkImage(
                        widget.paths[index],

                        //fit: BoxFit.fill,
                      ),
                      // errorBuilder: (context, error, stackTrace) {
                      //   return Image.asset(AppImages.noImage);
                      // },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.085,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.paths.length,
                itemBuilder: (builder, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPage = index;
                      });
                      _pageController.jumpToPage(index);
                    },
                    child: buildBottomImage(widget.paths[index], index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildBottomImage(String image, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: AppColors.textColor,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
          border: Border.all(
            width: 2.0,
            color: selectedPage == index
                ? AppColors.primaryColor
                : Colors.transparent,
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          // placeholder: (context, url) {
          //   return Image.asset(AppImages.noImage);
          // },
          // errorWidget: (context, url, _) {
          //   return Image.asset(AppImages.noImage);
          // },
        ),
      ),
    );
  }
}
