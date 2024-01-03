import 'package:e_commerce_app/home_featcher/domain/cubit/banner/bannerCubit.dart';
import 'package:e_commerce_app/home_featcher/presentation/helperMehods/buildCustomAppBar.dart';
import 'package:e_commerce_app/home_featcher/presentation/helperMehods/build_circual_catogey.dart';
import 'package:e_commerce_app/home_featcher/presentation/helperMehods/build_row_text.dart';
import 'package:e_commerce_app/home_featcher/presentation/widgets/custom_carsor.dart';

import 'package:e_commerce_app/shared/constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  int productId;
  HomeView({super.key, required this.productId});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // ignore: prefer_typing_uninitialized_variables
  var banners;
  @override
  void initState() {
    context.read<GetHomeCubitBanner>().getHomeData();
    // GetHomeCubit.get(context).getHomeData();

    super.initState();
    // print('the banner from init state is: $banners');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar:
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            child: Column(children: [
              //appbar
              buildCustomAppBar(),
              hsSizedBox,
              //slider
              const CustomCarouselSlider(),

              hSizedBox,
              buildRowText(
                  firstText: 'More Category',
                  secondClickableText: 'More Category'),

              hSizedBox,
              buildCirculaCatogory(),
              hSizedBox,
              buildRowText(
                  firstText: 'FlashSale', secondClickableText: 'See more'),

              hSizedBox,
            ]),
          ),
        ),
      ),
    );
  }
}
