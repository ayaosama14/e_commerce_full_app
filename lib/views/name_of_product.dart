import 'dart:core';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/shared/constant.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  //take model
  String appBarTitle;
  double productPrice;
  List listOfproductImage;
  String description;
  bool inFavorites;
  bool inCart;
  List listOfSizes = [5, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 11];
  List<Color> listOfColors = [
    Colors.red,
    Colors.pink,
    const Color.fromARGB(255, 255, 59, 239),
    Colors.yellow,
    Colors.blue,
    const Color.fromARGB(255, 79, 59, 255),
    Colors.green,
    Colors.cyan,
    Colors.black,
  ];
  ProductDetails({
    super.key,
    required this.appBarTitle,
    required this.productPrice,
    required this.listOfproductImage,
    required this.description,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  State<ProductDetails> createState() => _NameOfProductState();
}

class _NameOfProductState extends State<ProductDetails> {
  // String appbarTitleName;
  // {required this.appbarTitleName}
  _NameOfProductState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: [
          const Icon(
            Icons.search,
          ),
          hsSizedBox,
          const Icon(Icons.list),
          hsSizedBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //change slider for this view
              CarouselSlider(
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
                  widget.listOfproductImage.length,
                  (index) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        color: greyColor,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(widget.listOfproductImage[index]),
                      );
                    });
                  },
                ),
              ),

              hSizedBox,
              hSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  SizedBox(
                    height: 80,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Center(
                      child: Text(
                        widget.appBarTitle,
                        maxLines: 2,
                        textAlign: TextAlign.right,
                        style: boldTextStyle,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    iconSize: 26,
                    icon: const Icon(Icons.favorite, color: Colors.redAccent),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star, color: Colors.yellowAccent),
              ),
              hsSizedBox,
              Text(
                '${widget.productPrice} \$',
                style: vboldColorTextStyle,
              ),

              hSizedBox,
              Text(
                'Select Size ',
                style: boldTextStyle,
              ),
              hsSizedBox,
              //move this widget outsize the file SRP
              SizedBox(
                height: 60,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.listOfSizes.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 28,
                          child: Text('${widget.listOfSizes[index]}',
                              style: boldTextStyle),
                        ),
                      );
                    }),
              ),
              hSizedBox,

              Text(
                'Select Colors ',
                style: boldTextStyle,
              ),
              hSizedBox,
              //move this widget outsize the file SRP
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.listOfColors.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      radius: 28,
                      backgroundColor: widget.listOfColors[index],
                    );
                  },
                ),
              ),
              hSizedBox,
              Container(
                padding: const EdgeInsets.all(6),
                height: 400, color: greyColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Specification',
                      style: vboldTextStyle,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.description,
                          textDirection: TextDirection.rtl,
                          style: boldTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        hsSizedBox,
                      ],
                    )
                  ],
                ),

                //  Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [Text('Style:'), Text('cd113_44997')],
                // ),

                //product review
                // Container(
                //   height: 343,
                //   width: 343,
                //   color: Colors.white38,
                //   child: const Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [Text('Review Product')],
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
