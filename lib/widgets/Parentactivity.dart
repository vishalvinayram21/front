import 'package:flutter/material.dart';

class Parentact extends StatelessWidget {
  const Parentact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              CircularProgressIndicator(
              color: Colors.blueAccent,
              semanticsLabel: "6234",
              semanticsValue: "Goal 8000",
            ),
              Icon(
                Icons.directions_run,
                size: 28,
              )
      ]
          ),
          
          Container(

          ),
          Container(

          ),
          Container(

          )
        ],
      ),
    );
  }
}
