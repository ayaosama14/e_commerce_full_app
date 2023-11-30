import 'package:e_commerce_app/cubit/get_home/get_home_cubit.dart';
import 'package:e_commerce_app/cubit/get_home/get_home_states.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget customSlider(context) {
  return BlocBuilder<GetHomeCubit, GetHomeStates>(builder: (context, state) {
    if (state is LoadingState) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (state is HomeFailerState) {}

    if (state is HomeSucessState) {
      List? banners = GetHomeCubit.get(context).banner;
      // print('the banner from slider is: $banners');
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
          banners!.length,
          (index) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.network(banners[index]['image']),
                );
              },
            );
          },
        ),
      );
    }

    return const Text('There is an error try again!');
  });
}
