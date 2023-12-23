import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildSelectSize() {
    List listOfSizes = [5, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 11];
  return SizedBox(
    height: 60,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listOfSizes.length,
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
              child: Text('${listOfSizes[index]}', style: boldTextStyle),
            ),
          );
        }),
  );
}
