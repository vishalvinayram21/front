import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone/screens/signin_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var userName = '';

class LoggedInScreen extends StatefulWidget {
  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Welcome Gro',
            style: TextStyle(fontSize: 30),
          ),
          // const Text('(cellnumber: ' + ' uid:' + ')'),
          // (_auth.currentUser.phoneNumber != null ? _auth.currentUser.phoneNumber : '')
          //  (_auth.currentUser.uid != null ? _auth.currentUser.uid : '')
          Container(
            width: 200,
            height: 40,
            child: ElevatedButton(
                onPressed: () => {
                      //sign out
                      signOut()
                    },
                child: Text('Sign out')),
          )
        ],
      ),
    ));
  }

  Future getUser() async {
    if (_auth.currentUser != null) {
      var cellNumber = _auth.currentUser!.phoneNumber;
      cellNumber = '0' +
          _auth.currentUser!.phoneNumber!.substring(3, cellNumber!.length);
      debugPrint(cellNumber);
      await _firestore
          .collection('users')
          .where('cellnumber', isEqualTo: cellNumber)
          .get()
          .then((result) {
        if (result.docs.length > 0) {
          setState(() {
            userName = result.docs[0].data()['name'];
          });
        }
      });
    }
  }

  signOut() {
    //redirect
    _auth.signOut().then((value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => RegisterScreen())));
  }
}
