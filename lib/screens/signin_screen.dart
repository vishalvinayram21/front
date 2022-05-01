import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:phone/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phone/widgets/timer.dart';

import '../home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cellnumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';

  String text = '';
  String otpText = '';
  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
      // numberController.text = numberController.text + value;
    });
  }

  _otpText(String value) {
    setState(() {
      otpText = otpText + value;
    });
  }

  //Form controllers
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    cellnumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : registerScreen();
  }

  Widget registerScreen() {
    Size size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        // appBar: AppBar(
        //   title: const Text('Register new user'),
        // ),
        body: ListView(children: [
          Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Container(
                      //     child: Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 10.0, horizontal: 10.0),
                      //   child: TextFormField(
                      //     enabled: !isLoading,
                      //     controller: nameController,
                      //     textInputAction: TextInputAction.next,
                      //     onEditingComplete: () => node.nextFocus(),
                      //     decoration: const InputDecoration(
                      //         floatingLabelBehavior:
                      //             FloatingLabelBehavior.never,
                      //         labelText: 'Name'),
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Please enter a name';
                      //       }
                      //     },
                      //   ),
                      // )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: size.height / 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 30,
                              child: Container(
                                height: 300,
                                width: 284,
                                // padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              top: 60,
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

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                'Enter your',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'We will send OTP',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('+91',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Color(0xFF989898))),
                                const SizedBox(width: 7),
                                // SizedBox(
                                //   width: 100,
                                //   child: TextField(),
                                // )
                                Text(text,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0)),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: NumericKeyboard(
                                onKeyboardTap: _onKeyboardTap,
                                textColor: Colors.black,
                                rightButtonFn: () {
                                  setState(() {
                                    text = text.substring(0, text.length - 1);
                                  });
                                },
                                rightIcon: Icon(
                                  Icons.backspace,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(top: 10, bottom: 5),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        cellnumberController.text = text;
                                      });
                                      if (!isLoading) {
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, we want to show a loading Snackbar
                                          setState(() {
                                            signUp();
                                            isRegister = false;
                                            isOTPScreen = true;
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 200,
                                      height: 40,
                                      color: Theme.of(context).primaryColor,
                                      // padding: const EdgeInsets.symmetric(
                                      //   vertical: 15.0,
                                      //   horizontal: 15.0,
                                      // ),
                                      child: const Text(
                                        "Sign In",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'By Creating passcode you agree with our',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Terms & Conditions ',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12),
                                ),
                                const Text(
                                  'and',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      // Container(
                      //     child: Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 10.0, horizontal: 10.0),
                      //   child: TextFormField(
                      //     enabled: !isLoading,
                      //     keyboardType: TextInputType.phone,
                      //     controller: cellnumberController,
                      //     textInputAction: TextInputAction.done,
                      //     onFieldSubmitted: (_) => node.unfocus(),
                      //     decoration: const InputDecoration(
                      //         hintText: 'Cell Number',
                      //         floatingLabelBehavior:
                      //             FloatingLabelBehavior.never,
                      //         labelText: 'Cell Number'),
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Please enter a cell number';
                      //       }
                      //     },
                      //   ),
                      // )),
                    ],
                  ))
            ],
          )
        ]));
  }

  //
  //
  //
  //
  //
  //
  //
  //
  //

  Widget returnOTPScreen() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        // appBar: AppBar(
        //   title: Text('OTP Screen'),
        // ),
        body: ListView(children: [
          Form(
            key: _formKeyOTP,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: size.height / 3,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 100,
                        child: Container(
                          height: 300,
                          width: 300,
                          // padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/images/logo2.svg',
                          width: 160,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'OTP is shared on your',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'mobile number',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: Text(
                                  !isLoading
                                      ? "Enter OTP from SMS +91 ${cellnumberController.text}"
                                      : "Sending OTP code SMS",
                                  textAlign: TextAlign.center))),
                      !isLoading
                          ? Container(
                              child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('OTP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                          color: Color(0xFF989898))),
                                  const SizedBox(width: 10),
                                  Text(otpText,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0)),
                                ],
                              ),
                              // TextFormField(
                              //   enabled: !isLoading,
                              //   controller: otpController,
                              //   keyboardType: TextInputType.number,
                              //   inputFormatters: <TextInputFormatter>[
                              //     FilteringTextInputFormatter.digitsOnly
                              //   ],
                              //   initialValue: null,
                              //   autofocus: true,
                              //   decoration: const InputDecoration(
                              //       labelText: 'OTP',
                              //       labelStyle: TextStyle(color: Colors.black)),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'Please enter OTP';
                              //     }
                              //   },
                              // ),
                            ))
                          : Container(),
                      SizedBox(height: 15),
                      NumericKeyboard(
                        onKeyboardTap: _otpText,
                        textColor: Colors.black,
                        rightButtonFn: () {
                          setState(() {
                            otpText = otpText.substring(0, otpText.length - 1);
                          });
                        },
                        rightIcon: Icon(
                          Icons.backspace,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          OtpTimer(),
                        ],
                      ),
                      !isLoading
                          ? Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(top: 40, bottom: 5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        otpController.text = otpText;
                                      });
                                      if (_formKeyOTP.currentState!
                                          .validate()) {
                                        // If the form is valid, we want to show a loading Snackbar
                                        // If the form is valid, we want to do firebase signup...
                                        setState(() {
                                          isResend = false;
                                          isLoading = true;
                                        });
                                        try {
                                          await _auth
                                              .signInWithCredential(
                                                  PhoneAuthProvider.credential(
                                                      verificationId:
                                                          verificationCode,
                                                      smsCode: otpController
                                                          .text
                                                          .toString()))
                                              .then((user) async => {
                                                    //sign in was success
                                                    if (user != null)
                                                      {
                                                        //store registration details in firestore database
                                                        await _firestore
                                                            .collection('users')
                                                            .doc(_auth
                                                                .currentUser!
                                                                .uid)
                                                            .set(
                                                                {
                                                              // 'name': nameController
                                                              //     .text
                                                              //     .trim(),
                                                              'cellnumber':
                                                                  cellnumberController
                                                                      .text
                                                                      .trim(),
                                                            },
                                                                SetOptions(
                                                                    merge:
                                                                        true)).then(
                                                                (value) => {
                                                                      //then move to authorised area
                                                                      setState(
                                                                          () {
                                                                        isLoading =
                                                                            false;
                                                                        isResend =
                                                                            false;
                                                                      })
                                                                    }),

                                                        setState(() {
                                                          isLoading = false;
                                                          isResend = false;
                                                        }),
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                HomeScreen(),
                                                          ),
                                                          (route) => false,
                                                        )
                                                      }
                                                  })
                                              .catchError((error) => {
                                                    setState(() {
                                                      isLoading = false;
                                                      isResend = true;
                                                    }),
                                                  });
                                          setState(() {
                                            isLoading = true;
                                          });
                                        } catch (e) {
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 200,
                                      height: 40,
                                      color: Theme.of(context).primaryColor,
                                      child: const Text(
                                        "Submit",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CircularProgressIndicator(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      )
                                    ].where((c) => c != null).toList(),
                                  )
                                ]),
                      isResend
                          ? Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 5),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: InkWell(
                                        onTap: () async {
                                          setState(() {
                                            isResend = false;
                                            isLoading = true;
                                          });
                                          await signUp();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Theme.of(context).primaryColor,
                                          width: 200,
                                          height: 40,
                                          child: const Text(
                                            "Resend Code",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ))),
                            )
                          : Column(),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'By Creating passcode you agree with our',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Terms & Conditions ',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                          const Text(
                            'and',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }

  Future signUp() async {
    setState(() {
      isLoading = true;
    });
    debugPrint('Gideon test 1');
    var phoneNumber = '+91 ' + cellnumberController.text.toString();
    debugPrint('Gideon test 2');
    var verifyPhoneNumber = _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        debugPrint('Gideon test 3');
        //auto code complete (not manually)
        _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
              if (user != null)
                {
                  //store registration details in firestore database
                  await _firestore
                      .collection('users')
                      .doc(_auth.currentUser!.uid)
                      .set({
                        // 'name': nameController.text.trim(),
                        'cellnumber': cellnumberController.text.trim()
                      }, SetOptions(merge: true))
                      .then((value) => {
                            //then move to authorised area
                            setState(() {
                              isLoading = false;
                              isRegister = false;
                              isOTPScreen = false;

                              //navigate to is
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                ),
                                (route) => false,
                              );
                            })
                          })
                      .catchError((onError) => {
                            debugPrint(
                                'Error saving user to db.' + onError.toString())
                          })
                }
            });
        debugPrint('Gideon test 4');
      },
      verificationFailed: (FirebaseAuthException error) {
        debugPrint('Gideon test 5');
        //  error.message
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (verificationId, [forceResendingToken]) {
        debugPrint('Gideon test 6');
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint('Gideon test 7');
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );
    debugPrint('Gideon test 7');
    await verifyPhoneNumber;
    debugPrint('Gideon test 8');
  }
}
