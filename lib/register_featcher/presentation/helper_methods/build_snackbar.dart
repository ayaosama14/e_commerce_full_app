import 'package:e_commerce_app/register_featcher/domain/cubit/register_cubit.dart';
import 'package:e_commerce_app/shared/constant.dart';
import 'package:flutter/material.dart';

buildSnackerBar({
  required BuildContext context,
  required Color backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 10),
      elevation: 10.0,
      backgroundColor: backgroundColor,
      content: Text(
        RegisterCubit.get(context).responseRegisterValue!.data["message"],
        style: thinTextStyle,
      ),
    ),
  );
}
