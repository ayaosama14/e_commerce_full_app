import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';


buildRowText({ required String firstText , required String secondClickableText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(firstText, style: thinTextStyle),
      InkWell(
        onTap: () {},
        child: Text(secondClickableText, style: thinColorTextStyle),
      )
    ],
  );
}
