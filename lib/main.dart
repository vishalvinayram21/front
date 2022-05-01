import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:phone/home_screen.dart';
import 'package:phone/screens/signin_screen.dart';
import 'package:phone/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  runApp(MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 10));
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const  Text("Unable connect ",maxLines: 2,softWrap: true,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Phone Verification',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: const Color(0xFF949DFF),
              // scaffoldBackgroundColor: const Color(0xFFEFEFEF),
            ),
            home: HomeScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Column(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
