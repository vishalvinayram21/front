import 'package:flutter/material.dart';

Widget userContainer(
    {required String userIcon, required double width, required double height}) {
  return Container(
    width: 83,
    height: 73,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          userIcon,
          height: height,
          width: width,
        ),
        Text(
          '!23 bpm',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        Text("Pulse rate")
      ],
    ),
  );
}
