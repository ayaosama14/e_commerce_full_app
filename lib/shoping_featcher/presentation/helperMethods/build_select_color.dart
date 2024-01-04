import 'package:flutter/material.dart';

selectColorOfProduct() {
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
  return SizedBox(
    height: 60,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: listOfColors.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return CircleAvatar(
          radius: 28,
          backgroundColor: listOfColors[index],
        );
      },
    ),
  );
}
