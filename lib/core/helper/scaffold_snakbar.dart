  import 'package:flutter/material.dart';

void scaffoldSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message),
    )));
  }