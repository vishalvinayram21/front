// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:numeric_keyboard/numeric_keyboard.dart';
// import 'package:phone/screens/home_screen.dart';
// import 'package:phone/screens/signin_screen.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _formKeyOTP = GlobalKey<FormState>();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   final TextEditingController numberController = new TextEditingController();
//   final TextEditingController otpController = new TextEditingController();

//   var isLoading = false;
//   var isResend = false;
//   var isLoginScreen = true;
//   var isOTPScreen = false;
//   var verificationCode = '';
//   String text = '';
//   String otpText = '';
//   _onKeyboardTap(String value) {
//     setState(() {
//       text = text + value;
//       // numberController.text = numberController.text + value;
//     });
//   }

//   _otpText(String value) {
//     setState(() {
//       otpText = otpText + value;
//     });
//   }

//   //Form controllers
//   @override
//   void initState() {
//     if (_auth.currentUser != null) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//           builder: (BuildContext context) => LoggedInScreen(),
//         ),
//         (route) => false,
//       );
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     numberController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isOTPScreen ? returnOTPScreen() : returnLoginScreen();
//   }

//   Widget returnLoginScreen() {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: AppBar(
//           title: Text('After Login'),
//         ),
//         body: ListView(controller: AdjustableScrollController(60), children: [
//           Column(
//             children: [
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: size.height / 3,
//                       decoration:
//                           BoxDecoration(color: Theme.of(context).primaryColor),
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Positioned(
//                             top: 100,
//                             child: Container(
//                               height: 300,
//                               width: 300,
//                               // padding: const EdgeInsets.all(10.0),
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 0,
//                             child: Image.asset(
//                               'assets/images/Icon.png',
//                               width: 180,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 15),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text(
//                               'Enter your',
//                               style: TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text(
//                               'Mobile Number',
//                               style: TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Text(
//                               'We will send OTP',
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 14),
//                             ),
//                           ),
//                           SizedBox(height: 20),

//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text('+91',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25.0,
//                                       color: Color(0xFF989898))),
//                               const SizedBox(width: 10),
//                               // SizedBox(
//                               //   width: 100,
//                               //   child: TextField(),
//                               // )
//                               Text(text,
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25.0)),
//                             ],
//                           ),
//                           // Container(
//                           //     child: Padding(
//                           //   padding: const EdgeInsets.symmetric(
//                           //       vertical: 10.0, horizontal: 10.0),
//                           //   child: TextFormField(
//                           //     enabled: !isLoading,
//                           //     controller: numberController,
//                           //     keyboardType: TextInputType.phone,
//                           //     decoration:
//                           //         InputDecoration(labelText: 'Phone Number'),
//                           //     validator: (value) {
//                           //       if (value!.isEmpty) {
//                           //         return 'Please enter phone number';
//                           //       }
//                           //     },
//                           //   ),
//                           // )),
//                           NumericKeyboard(
//                             onKeyboardTap: _onKeyboardTap,
//                             textColor: Colors.black,
//                             rightButtonFn: () {
//                               setState(() {
//                                 text = text.substring(0, text.length - 1);
//                               });
//                             },
//                             rightIcon: Icon(
//                               Icons.backspace,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                           Container(
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.only(top: 40, bottom: 5),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: !isLoading
//                                   ? ElevatedButton(
//                                       onPressed: () async {
//                                         setState(() {
//                                           numberController.text = text;
//                                         });
//                                         if (!isLoading) {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             displaySnackBar('Please wait...');
//                                             await login();
//                                           }
//                                         }
//                                       },
//                                       child: Container(
//                                           padding: const EdgeInsets.symmetric(
//                                             vertical: 15.0,
//                                             horizontal: 15.0,
//                                           ),
//                                           child: Text('Sign In')),
//                                     )
//                                   : CircularProgressIndicator(
//                                       backgroundColor:
//                                           Theme.of(context).primaryColor,
//                                     ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ]));
//   }

//   Widget returnOTPScreen() {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         key: _scaffoldKey,
//         // appBar: new AppBar(
//         //   title: Text('OTP Screen'),
//         // ),
//         body: ListView(children: [
//           Form(
//             key: _formKeyOTP,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: size.height / 3,
//                   decoration:
//                       BoxDecoration(color: Theme.of(context).primaryColor),
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Positioned(
//                         top: 100,
//                         child: Container(
//                           height: 300,
//                           width: 300,
//                           // padding: const EdgeInsets.all(10.0),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         child: Image.asset(
//                           'assets/images/Icon.png',
//                           width: 180,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Text(
//                     'OTP is shared on your',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: const Text(
//                     'mobile number',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.center,
//                 //   children: [
//                 //     const Text('+91',
//                 //         style: TextStyle(
//                 //             fontWeight: FontWeight.bold,
//                 //             fontSize: 25.0,
//                 //             color: Color(0xFF989898))),
//                 //     const SizedBox(width: 10),
//                 //     Text(text,
//                 //         style: const TextStyle(
//                 //             fontWeight: FontWeight.bold, fontSize: 25.0)),
//                 //   ],
//                 // ),

//                 Container(
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 10.0),
//                         child: Text(
//                             !isLoading
//                                 ? "Enter OTP from SMS +91 ${numberController.text}"
//                                 : "Sending OTP code SMS",
//                             textAlign: TextAlign.center))),
//                 !isLoading
//                     ? Container(
//                         child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 10.0, horizontal: 10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text('OTP',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25.0,
//                                     color: Color(0xFF989898))),
//                             const SizedBox(width: 10),
//                             Text(otpText,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25.0)),
//                           ],
//                         ),
//                         //  TextFormField(
//                         //   enabled: !isLoading,
//                         //   controller: otpController,
//                         //   keyboardType: TextInputType.number,
//                         //   inputFormatters: <TextInputFormatter>[
//                         //     FilteringTextInputFormatter.digitsOnly
//                         //   ],
//                         //   initialValue: null,
//                         //   autofocus: true,
//                         //   decoration: InputDecoration(
//                         //       labelText: 'OTP',
//                         //       labelStyle: TextStyle(color: Colors.black)),
//                         //   validator: (value) {
//                         //     if (value!.isEmpty) {
//                         //       return 'Please enter OTP';
//                         //     }
//                         //   },
//                         // ),
//                       ))
//                     : Container(),
//                 NumericKeyboard(
//                   onKeyboardTap: _otpText,
//                   textColor: Colors.black,
//                   rightButtonFn: () {
//                     setState(() {
//                       otpText = otpText.substring(0, otpText.length - 1);
//                     });
//                   },
//                   rightIcon: Icon(
//                     Icons.backspace,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//                 !isLoading
//                     ? Container(
//                         margin: EdgeInsets.only(top: 40, bottom: 5),
//                         child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 setState(() {
//                                   otpController.text = otpText;
//                                 });
//                                 if (_formKeyOTP.currentState!.validate()) {
//                                   // If the form is valid, we want to show a loading Snackbar
//                                   // If the form is valid, we want to do firebase signup...
//                                   setState(() {
//                                     isResend = false;
//                                     isLoading = true;
//                                   });
//                                   try {
//                                     await _auth
//                                         .signInWithCredential(
//                                             PhoneAuthProvider.credential(
//                                                 verificationId:
//                                                     verificationCode,
//                                                 smsCode: otpController.text
//                                                     .toString()))
//                                         .then((user) async => {
//                                               //sign in was success
//                                               if (user != null)
//                                                 {
//                                                   //store registration details in firestore database
//                                                   setState(() {
//                                                     isLoading = false;
//                                                     isResend = false;
//                                                   }),
//                                                   Navigator.pushAndRemoveUntil(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (BuildContext
//                                                               context) =>
//                                                           LoggedInScreen(),
//                                                     ),
//                                                     (route) => false,
//                                                   )
//                                                 }
//                                             })
//                                         .catchError((error) => {
//                                               setState(() {
//                                                 isLoading = false;
//                                                 isResend = true;
//                                               }),
//                                             });
//                                     setState(() {
//                                       isLoading = true;
//                                     });
//                                   } catch (e) {
//                                     setState(() {
//                                       isLoading = false;
//                                     });
//                                   }
//                                 }
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 15.0,
//                                   horizontal: 15.0,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     Expanded(
//                                       child: Text(
//                                         "Submit",
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )))
//                     : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 CircularProgressIndicator(
//                                   backgroundColor:
//                                       Theme.of(context).primaryColor,
//                                 )
//                               ].where((c) => c != null).toList(),
//                             )
//                           ]),
//                 isResend
//                     ? Container(
//                         margin: EdgeInsets.only(top: 40, bottom: 5),
//                         child: Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 setState(() {
//                                   isResend = false;
//                                   isLoading = true;
//                                 });
//                                 await login();
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 15.0,
//                                   horizontal: 15.0,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     Expanded(
//                                       child: Text(
//                                         "Resend Code",
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )))
//                     : Column()
//               ],
//             ),
//           )
//         ]));
//   }

//   displaySnackBar(text) {
//     final snackBar = SnackBar(content: Text(text));
//     _scaffoldKey.currentState!.showSnackBar(snackBar);
//   }

//   Future login() async {
//     setState(() {
//       isLoading = true;
//     });

//     var phoneNumber = '+91 ' + numberController.text.trim();

//     //first we will check if a user with this cell number exists
//     var isValidUser = false;
//     var number = numberController.text.trim();

//     await _firestore
//         .collection('users')
//         .where('cellnumber', isEqualTo: number)
//         .get()
//         .then((result) {
//       if (result.docs.length > 0) {
//         isValidUser = true;
//       }
//     });

//     if (isValidUser) {
//       //ok, we have a valid user, now lets do otp verification
//       var verifyPhoneNumber = _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (phoneAuthCredential) {
//           //auto code complete (not manually)
//           _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
//                 if (user != null)
//                   {
//                     //redirect
//                     setState(() {
//                       isLoading = false;
//                       isOTPScreen = false;
//                     }),
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => LoggedInScreen(),
//                       ),
//                       (route) => false,
//                     )
//                   }
//               });
//         },
//         verificationFailed: (FirebaseAuthException error) {
//           displaySnackBar('Validation error, please try again later');
//           setState(() {
//             isLoading = false;
//           });
//         },
//         codeSent: (verificationId, [forceResendingToken]) {
//           setState(() {
//             isLoading = false;
//             verificationCode = verificationId;
//             isOTPScreen = true;
//           });
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           setState(() {
//             isLoading = false;
//             verificationCode = verificationId;
//           });
//         },
//         timeout: Duration(seconds: 60),
//       );
//       await verifyPhoneNumber;
//     } else {
//       //non valid user
//       setState(() {
//         isLoading = false;
//       });
//       displaySnackBar('Number not found, please sign up first');
//     }
//   }
// }

// class AdjustableScrollController extends ScrollController {
//   AdjustableScrollController([int extraScrollSpeed = 40]) {
//     super.addListener(() {
//       ScrollDirection scrollDirection = super.position.userScrollDirection;
//       if (scrollDirection != ScrollDirection.idle) {
//         double scrollEnd = super.offset +
//             (scrollDirection == ScrollDirection.reverse
//                 ? extraScrollSpeed
//                 : -extraScrollSpeed);
//         scrollEnd = min(super.position.maxScrollExtent,
//             max(super.position.minScrollExtent, scrollEnd));
//         jumpTo(scrollEnd);
//       }
//     });
//   }
// }
