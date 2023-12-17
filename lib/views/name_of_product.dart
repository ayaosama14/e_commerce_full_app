import 'package:e_commerce_app/shared/constant.dart';
import 'package:e_commerce_app/widgets/custom_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NameOfProduct extends StatefulWidget {
  //take model
  String appBarTitle;
  String productPrice;
  List listOfSizes = [6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10];
  List<Color> listOfColors = [
    Colors.yellow,
    Colors.yellow,
    Colors.blue,
    const Color.fromARGB(255, 255, 59, 239),
    Colors.green,
    Colors.black,
    const Color.fromARGB(255, 79, 59, 255),
  ];
  NameOfProduct(
      {super.key, required this.appBarTitle, required this.productPrice});

  @override
  State<NameOfProduct> createState() => _NameOfProductState();
}

class _NameOfProductState extends State<NameOfProduct> {
  // String appbarTitleName;
  // {required this.appbarTitleName}
  _NameOfProductState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: const [
          Icon(
            Icons.search,
          ),
          Icon(Icons.more_sharp)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            //change slider for this view
            customSlider(context),

            hsSizedBox,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.appBarTitle,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 28),
                ),
                const Icon(Icons.favorite),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.star),
                ),
                hsSizedBox,
                Text(widget.productPrice),
                hSizedBox,
                hSizedBox,
                const Text('Select Size '),
                hSizedBox,
                //move this widget outsize the file SRP
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.listOfSizes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CircleAvatar(
                        child: Text('${widget.listOfSizes[index]}'),
                      );
                    }),
                hSizedBox,

                const Text('Select Colors '),
                hSizedBox,
                //move this widget outsize the file SRP
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.listOfColors.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(widget.listOfColors[index] as int),
                    );
                  },
                ),
                hSizedBox,
                Column(
                  children: [
                    const Text(
                      'Specification',
                      style: TextStyle(fontSize: 28),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Shown:'),
                        Column(
                          children: [
                            const Text('data'),
                            hsSizedBox,
                            const Text('data'),
                            hsSizedBox,
                            const Text('data'),
                            hsSizedBox,
                          ],
                        )
                      ],
                    )
                  ],
                ),
                hSizedBox,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Style:'), Text('cd113_44997')],
                ),
                hSizedBox,
                //product review
                Container(
                  height: 343,
                  width: 343,
                  color: Colors.white38,
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Review Product')],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
