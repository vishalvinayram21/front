import 'package:flutter/material.dart';
import 'package:phone/widgets/Parentactivity.dart';

Widget userContainer(
    {required String userIcon, required double width, required double height, required String person}) {
  return Container(
    width: 83,
    height: 120,
    child: Column(
      children: [
        Container(
          width: 83,
          height: 74,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
              width: 2,
            ),
                borderRadius: BorderRadius.circular(10)

            ),
          child: Column(
            children: [
             /* Positioned(
                top:0,
                right: 0,
                child: Container(
                  alignment: Alignment.topLeft,
                  height:3,
                  width: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                        color: Colors.red
                  ),
                ),
              ),
              */
              Container(
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Image.asset(
                  userIcon,
                  height: height,
                  width: width,
                ),
              ),
              Text(
                '!23 bpm',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              Text("Pulse rate",style: TextStyle(fontSize: 11),)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
            child: Text(person,style: TextStyle(fontWeight: FontWeight.bold),)),

      ],
    ),
  );
}
