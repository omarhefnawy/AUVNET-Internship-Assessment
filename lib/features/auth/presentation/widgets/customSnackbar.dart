import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar CustomSnackBar(BuildContext context,Color color)
{
  return SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Login success",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        IconButton(
          icon: Icon(Icons.close, color: Colors.black87),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ],
    ),
    backgroundColor: color, // لون أفتح وأنيق
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    duration: Duration(seconds: 2), // زيادة المدة لثواني
  );
}