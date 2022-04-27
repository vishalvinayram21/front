import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phone/widgets/Addbene.dart';
import 'package:phone/widgets/Parentactivity.dart';
import 'Graph.dart';

class Counters extends StatelessWidget {
  const Counters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 283,
          width: 388,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
                colors: <Color>[
                  Color.fromRGBO(142, 197, 252, 1),
                  Color.fromRGBO(146, 164, 253, 1),



                ]
            ),
            borderRadius: BorderRadius.circular(10),
            color:const Color.fromRGBO(142, 197, 252, 1),

          ),
          child:Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(13, 10, 13, 6),
                alignment: Alignment.topLeft,
                child:const Text('Today',style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "Helvetica Nee",
                  color: Colors.white,
                ),
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 157,
                      height: 125,
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253,253, 253, 0.3),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                            width: 86,
                          height: 58,
                          child:Text("500",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,
                            fontFamily: "Helvetica Neue",
                            color: Colors.white,),)
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.values[
                              2
                            ],
                            children: [
                              Icon(Icons.directions_walk,color: Colors.white,),
                              Container(
                                child: Text('Steps',style: TextStyle( fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica Neue",
                                    color: Colors.white),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 157,
                    height: 128,
                    margin: EdgeInsets.fromLTRB(0, 6, 20, 20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(253,253, 253, 0.3),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 5),

                              width: 86,
                              height: 58,
                              child:Text("500",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,
                                fontFamily: "Helvetica Neue",
                                color: Colors.white,),)
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.fromLTRB(left, top, right, bottom),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.values[
                            2
                            ],
                            children: [
                              Icon(Icons.local_fire_department_outlined,color: Colors.white,),
                              Container(
                                child: Text("Calorie",style: TextStyle( fontWeight: FontWeight.w400,
                                    fontFamily: "Helvetica Neue",
                                    color: Colors.white),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )


                ],
              ),

              Container(
                width: 335,
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Color.fromRGBO(253, 253, 253, 0.3),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hortab("108 MIN","Time"),
                    Hortab("2.4 KM","Distance"),
                    Hortab("8000","Target"),
                  ],
                ),
              )
            ],

          )
        ),
        Container(
          height: 200,
            width: MediaQuery.of(context).size.width,
            child: Graphing()),
        Container(
          width: 388,
          height: 146,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(146, 164, 253, 1),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
                end:Alignment.centerRight,
                colors: [
              Color.fromRGBO(157, 206, 255, 0.9),
              Color.fromRGBO(157, 206, 253, 0.8),
              Color.fromRGBO(146, 163, 253, 0.7),
                  Color.fromRGBO(146, 163, 253, 0.7),
                  Color.fromRGBO(146, 163, 253, 0.8),
                  Color.fromRGBO(146, 163, 253, 0.9),

            ]

            )


          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 26, 0,0),
                      width:115,
                      height: 21,
                      child:Text(
                        "ABHA -Health Id",
                        style: TextStyle(
                            fontFamily: "Helvetica Neue",
                        fontSize: 14,
                            fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),
                      )
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(30, 5, 0,0),
                        alignment: Alignment.centerLeft,
                        width:192,
                        height: 18,
                        child:Text(
                          "A vision of India we help you with",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: "Helvetica Neue",
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,

                          ),
                        )
                    ),
                    ElevatedButton(onPressed: (){}, child: Container(
                      child: Text("View More",),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(197, 139, 242, 1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                    ),)

                    ),
                  ],

              ),
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.white,
                ),
                child:Image.asset('assets/images/creditcard.png',height: 40,width: 40,),
              ),
              ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(13, 24, 0, 15),
          child: Text("Parent Activity",style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: "Poppins",
            color: Colors.black54,
          ),),
        ),
        Parentact(),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(13, 24, 0, 15),
                    child: Text("Add on benefits",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Colors.black45,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.fromLTRB(13, 24, 0, 15),
                    child: Text("See All",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      color: Colors.black54,
                    ),),
                  ),

                ],

              ),
              Row(
                children:[
              Circulartab(),
                  Circulartab(),
                  Circulartab(),


                ]
              )
            ],
          ),
        ),
        //CircularTab(s:Image.asset('asserts/images/exercise.png'), "Diet")
        //CircularTab(Image.asset('asserts/images/exercise.png'), "Diet" ),
        Row(
          children: [
            Circulartab(),
            Circulartab(),
            Circulartab(),


          ],
        ),


      ],
    );
  }
}


class Hortab extends StatelessWidget {
  final String s;
  final String val;
  const Hortab(this.s, this.val, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(s.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: "Bebas Neue"),
              ),
            ),
            Container(
              child: Text(val,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Bebas Neue"),
              ),
            ),
             //Graphing(),
           // Graphing('HELLO'),
          ],
        )
    );
  }
}
/*
class CircularTab extends StatelessWidget {
  final String val;
  final Image imag;
  CircularTab(this.imag, this.val);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),

        child: Image.asset(
          imag.image.toString(),
          fit: BoxFit.fill,
        )
      )
    ]
    );
  }
}*/

