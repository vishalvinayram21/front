import 'package:flutter/material.dart';

class GoogleFit extends StatefulWidget {
  const GoogleFit({Key? key}) : super(key: key);

  @override
  State<GoogleFit> createState() => _GoogleFitState();
}

class _GoogleFitState extends State<GoogleFit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('where it all belongs to boring company'),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.red,
              height: 50,
              width: 150,
              child: Text('Go back to the center'),
            ),
          )
        ],
      ),
    );
  }
}
