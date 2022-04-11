import 'package:flutter/material.dart';

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
                  ),
                  SizedBox(width: 14),
                  userContainer(
                      userIcon: 'assets/home/image 4.png',
                      height: 25,
                      width: 27),
                  SizedBox(width: 14),
                  userContainer(
                      userIcon: 'assets/home/image 30.png',
                      height: 25,
                      width: 27),
                  SizedBox(width: 14),
                  userContainer(
                      userIcon: 'assets/home/image 30.png',
                      height: 25,
                      width: 28),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
