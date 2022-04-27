import 'package:flutter/material.dart';

class Parentact extends StatelessWidget {
  const Parentact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
      height:158 ,
      width: 388,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
        color:Colors.white ,
       // border: Border
         boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: const Offset(
              0.0,
              0.0,
            ),
            blurRadius: 4.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(13, 10, 0, 20),
            alignment: Alignment.topLeft,
            child:Text("Today",style: TextStyle(
              fontSize: 12,
              fontFamily: "Poppins",
              color: Color.fromRGBO(126, 126, 126, 1)
            ),)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children:  [
                  Container(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value:0.75,
                    strokeWidth: 4.0,
                    color: Colors.blueAccent,
                    semanticsLabel: "6234",
                    semanticsValue: "Goal 8000",
                ),
                  ),
                  Positioned(
                    top: 20,
                    left: 40,
                    child: Icon(
                      Icons.directions_run,
                      size: 28,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                      top:50,
                      left:20,
                      child: Column(
                    children: [
                      Text("6235",style:TextStyle(fontSize: 15)),
                      Text("Goal 8000",style: TextStyle(fontSize: 12),
                      )
                    ],
                  ))
          ]
              ),

              Column(
                children: [
                  Stack(
                      children:  [
                        Container(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            value:.5,
                            strokeWidth: 4.0,
                            color: Colors.blueAccent,
                            semanticsLabel: "6234",
                            semanticsValue: "Goal 8000",
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(
                            Icons.local_fire_department_rounded,
                            color: Colors.orange,
                            size: 28,
                          ),
                        ),
                      ]
                  ),
                  Text("29 kcal")
                ],
              ),
              Column(
                children: [
                  Stack(
                      children:  [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            value:.35,
                            strokeWidth: 4.0,
                            color: Colors.blueAccent,
                            semanticsLabel: "6234",
                            semanticsValue: "Goal 8000",
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 20,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      ]
                  ),
                  Text("788 m")
                ],
              ),
              
              Column(
                children: [
                  Stack(
                      children:  [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            value:.60,
                            strokeWidth: 4.0,
                            color: Colors.blueAccent,
                            semanticsLabel: "6234",
                            semanticsValue: "Goal 8000",
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 30,
                          child: Icon(
                            Icons.access_time,
                            color: Colors.green,
                            size: 28,
                          ),
                        ),

                      ]
                  ),
                  Text("35 min")
                ],
              ),

              Container(

              ),
              Container(

              ),
              Container(

              )
            ],
          ),
        ],
      ),
    );
  }
}

class Benfits extends StatelessWidget {
  const Benfits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


