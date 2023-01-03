import 'package:flutter/material.dart';

import '../Models/models.dart';

class SliderProvider extends ChangeNotifier {
  List<SliderImage> sliders = [
    SliderImage(
      id: 1,
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Banners/gifting2022/images/birthdayanniversarygifts.jpg',
    ),
    SliderImage(
      id: 2,
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Banners/gifting2022/images/treatsforself.jpg',
    ),
    SliderImage(
      id: 3,
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Banners/gifting2022/images/auspiciousoccasions.jpg',
    ),
    SliderImage(
      id: 4,
      imageUrl:
          'https://staticimg.titan.co.in/Tanishq/Banners/gifting2022/images/giftsfordad.jpg',
    ),
  ];

  List<SliderImage> get sliderImagesList => sliders;
}
