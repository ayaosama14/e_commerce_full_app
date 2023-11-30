import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget customSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200,
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      scrollDirection: Axis.horizontal,
    ),
    items: [1, 2, 3, 4].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Promotion Image.png'),
                ),
              ),
              child: Text(
                'text $i',
                style: const TextStyle(fontSize: 16.0),
              ));
        },
      );
    }).toList(),
  );
}
