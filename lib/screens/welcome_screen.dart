import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phone/screens/signin_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color:Colors.grey,
           //Theme.of(context).primaryColor,
            /*image: DecorationImage(
                image: AssetImage('assets/images/welcome_home.png'),
                fit: BoxFit.fitWidth)),*/),
        child: Container(
          color: Color.fromRGBO(158, 168, 255, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 100.0,
                    ),
                    Text(
                      'Hi Welcome to',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'CloZzr',
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'All your health data at your fingertips.',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),

                  ],

                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(148, 157, 255, 1),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(500),topLeft: Radius.circular(500))
                ),
                child: Column(
                  children: [
              Column(
                children: [
                  Container(
                    height: size.height/2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        color: Color.fromRGBO(140, 157, 255, 1),

                ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: size.height / 3,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(158, 166, 255, 1),
                            borderRadius: BorderRadius.vertical(top: Radius.elliptical(1800,1800),
                            ),
                              gradient:   RadialGradient(
                                center: Alignment.bottomCenter,
                                radius: 1,
                                focalRadius: 200,
                                stops: [
                                 0.74,
                                  0.74,
                                  .75,
                                  .85
                                ],
                                colors: [
                                  Color.fromRGBO(158, 166, 255, 1),
                                  Color.fromRGBO(153, 161, 253, 1),
                                  Color.fromRGBO(154, 163, 255, 1),
                                  Color.fromRGBO(144, 150, 255, 1),
                                ],
                              )

                          )
                          ,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 70,
                                child: Container(
                                  height: 254,
                                  width: 284,
                                  // paddinging: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(1500),)
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                top: 100,
                                child: SvgPicture.asset(
                                  'assets/images/logo2.svg',
                                  width: 89,
                                  height: 100,
                                ),
                                // Image.asset(
                                //   'assets/images/Icon.png',
                                //   width: 180,
                                // ),
                              ),
                            ],
                          ),
                        ),
                         Container(
                           decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                               color: Color.fromRGBO(140, 157, 255, 1),

                         ),
                           child: Positioned(
                             top: 108,
                             bottom: size.height,
                             child: Container(
                               padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                               child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFFEBEAEC),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('Get Started',
                                        style: TextStyle(color: Colors.black)
                                    )
                               ),
                             ),
                           ),
                         ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(130 ,10 ,130 , 30),
                    child: Divider(
                      color: Color.fromRGBO(230, 230, 230, 1),
                      thickness: 7,
                    ),
                  )
                ],
              ),
            ],
          ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
