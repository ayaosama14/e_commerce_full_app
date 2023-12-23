import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/cupertino.dart';


Widget carouselSliderProduct(List listOfproductImage) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    ),

    /// first way
    items: List.generate(
      listOfproductImage.length,
      (index) {
        return Builder(builder: (BuildContext context) {
          return Container(
            color: greyColor,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.network(listOfproductImage[index]),
          );
        });
      },
    ),
  );
}
