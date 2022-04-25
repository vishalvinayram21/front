import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counters extends StatelessWidget {
  const Counters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 283,
      width: 388,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
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
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(s.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,fontFamily: "Bebas Neue"),
          ),
          Text(val,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Bebas Neue"),)
        ],
      )
    );
  }
}
