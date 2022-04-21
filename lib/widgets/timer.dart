import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({Key? key}) : super(key: key);

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
        child: const Text(
          'the end',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        duration: const Duration(seconds: 90),
        tween: Tween(begin: const Duration(seconds: 90), end: Duration.zero),
        builder: (BuildContext context, Duration value, Widget? child) {
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return value.inSeconds == 0
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      const OtpTimer();
                    });
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ))
              : Text(
                  'Resend OTP in ${minutes}:${seconds}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                );
        });
  }
}

// import 'package:flutter/material.dart';

// class OtpTimer extends StatefulWidget {
//   const OtpTimer({Key? key}) : super(key: key);

//   @override
//   _OtpTimerState createState() => _OtpTimerState();
// }

// class _OtpTimerState extends State<OtpTimer> {
//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<Duration>(
//         child: const Text(
//           'the end',
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             fontSize: 13,
//             color: Colors.black,
//           ),
//         ),
//         duration: const Duration(seconds: 90),
//         tween: Tween(begin: const Duration(seconds: 90), end: Duration.zero),
//         builder: (BuildContext context, Duration value, Widget? child) {
//           final minutes = value.inMinutes;
//           final seconds = value.inSeconds % 60;
//           return value.inSeconds == 0
//               ? TextButton(
//                   onPressed: () {
//                     setState(() {
//                       const OtpTimer();
//                     });
//                   },
//                   child: const Text(
//                     'Resend Code',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 13,
//                       color: Colors.black,
//                     ),
//                   ))
//               : Text(
//                   'Resend OTP in ${minutes}:${seconds}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 13,
//                     color: Colors.black,
//                   ),
//                 );
//         });
//   }
// }
