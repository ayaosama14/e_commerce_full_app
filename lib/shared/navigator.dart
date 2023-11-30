import 'package:flutter/material.dart';

navigate(BuildContext context, Widget route) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => route,
    ),
  );
}
