import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Constant {
//error massage
  static showErrorMassage(
      {required BuildContext context, required String massege}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(massege),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok',
                style: TextStyle(textBaseline: TextBaseline.alphabetic)),
          ),
        ],
      ),
    );
  }

//   static showToast(
//       {required BuildContext context,
//       required String massege,
//       Color? backgroundColor,
//       Color? textColor}) {
//     return Fluttertoast.showToast(
//         msg: massege,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: backgroundColor,
//         textColor: textColor,
//         fontSize: 16.0);
//   }
}
