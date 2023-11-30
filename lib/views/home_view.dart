import 'package:e_commerce_app/cubit/change_password/chane_pass_states.dart';
import 'package:e_commerce_app/cubit/get_catogery/cubit_get_catogery.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/widgets/build_image_category.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/widgets/custom_row_text.dart';
import 'package:e_commerce_app/widgets/custom_slider.dart';

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
  @override
  void initState() {
    context.read<GetCatogeryCubit>().getCatogeryData(id: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            child: Column(children: [
              //slider
              customSlider(),
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
