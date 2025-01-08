import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/constants/color_consatnts.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
  });
  static const List<String> _offerImages = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _offerImages.length,
      itemBuilder: (context, index, realIndex) => Container(
        decoration: BoxDecoration(
          color: ColorConsatnts.white,
          image: DecorationImage(
            image: AssetImage(
              _offerImages[index],
            ),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        height: 118.h,
        autoPlay: true,
        reverse: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 900),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
