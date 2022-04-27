
import 'package:flutter/material.dart';

class Circulartab extends StatelessWidget {
  const Circulartab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        children: [
          (
            Column(
                children:[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: ClipRRect(
                      child: Image.asset('assets/images/exercise.png',height: 100,width: 100,fit: BoxFit.fill,),
                      borderRadius: BorderRadius.circular(100),
                        ),
                  ),
                  Text("Exercise",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                ]
            )
          ),
        ],
      ),
    );
  }
}
