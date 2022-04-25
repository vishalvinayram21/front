import 'package:flutter/material.dart';
import 'package:phone/widgets/Counter.dart';

import '../widgets/user_container.dart';

Widget TabHome() {
  return ListView(
    children: [
      Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 15),
            const Text(
              'Hello, Gro',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Displaying your favourite data',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 22),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  userContainer(
                    userIcon: 'assets/home/Heart.png',
                    height: 25,
                    width: 28,
                    person:"Father"
                  ),
                  SizedBox(width: 14),
                  userContainer(
                      userIcon: 'assets/home/image 4.png',
                      height: 25,
                      width: 27,
                  person:"Mother"),
                  SizedBox(width: 14),
                  userContainer(
                      userIcon: 'assets/home/image 30.png',
                      height: 25,
                      width: 27,
                  person:"Child"),
                  SizedBox(width: 14),
                  userContainer(
                      userIcon: 'assets/home/image 30.png',
                      height: 25,
                      width: 28,
                  person:"More"),


                ],

              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 16),
                child: Text("Activites",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ),
            Counters(),
            Graphical(),
          ],
        ),
      ),
    ],
  );
}




class Graphical extends StatelessWidget {
  const Graphical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(13, 16, 13, 0),
      width: 388,
      height: 150,
      decoration: BoxDecoration(
        color: Color.fromRGBO(146, 164, 253, 0.4),
        borderRadius: BorderRadius.circular(20)
      ),
      child:Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 24.6, 0),
            width: 64,
            height: 18,
            child: Text('Heart Rate',style: TextStyle(
              fontSize: 12,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500
            ),
            ),
          ),
          Container(
            child: Text("78 rpm",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
          )
        ],
      )
    );
  }
}
