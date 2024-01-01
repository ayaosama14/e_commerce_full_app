import 'package:flutter/material.dart';

Widget buildElevated(
    {String? text,
    required void Function()? onPressFunction,
    bool? isnotRow,
    Widget? widgetA}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      foregroundColor: Colors.white,
      backgroundColor:
          isnotRow! ? const Color.fromARGB(255, 29, 198, 210) : Colors.white,
    ),
    onPressed: onPressFunction,
    child: isnotRow
        ? Text(
            text!,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widgetA!,
              const SizedBox(width: 10),
              Text(
                text!,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
  );
}
