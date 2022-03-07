import 'dart:async';

import 'package:abdullahriaz95_dot_com/ui/home_page.dart';
import 'package:abdullahriaz95_dot_com/ui/largeAndMedium/large_layout.dart';
import 'package:abdullahriaz95_dot_com/ui/small/small_layout.dart';
import 'package:abdullahriaz95_dot_com/widgets/responsive.dart';
import 'package:animate_my_text/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double size = 0;
  bool showName = false;
  double opacity = 1;
  @override
  initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(
        () {
          size = 100;
        },
      );
    });

    Timer(Duration(seconds: 2), () {
      setState(
        () {
          showName = true;
        },
      );
    });

    Timer(Duration(seconds: 6), () {
      // Navigator.pushNamed(context, '/home');

      Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) {
            return HomePage();
          },
          transitionDuration: Duration(milliseconds: 1000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation =
                CurvedAnimation(curve: Curves.easeOutCubic, parent: animation);
            return Align(
              child: SlideTransition(
                position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              ),
            );
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 8),
                ),
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInOutQuint,
                height: size,
                width: size,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'A',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              if (showName)
                SizedBox(
                  height: 16,
                ),
              if (showName)
                AnimatedText(
                  text: 'Abdullah Riaz',
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.white, fontSize: 40),
                  durationBetweenLetters: Duration(milliseconds: 70),
                  letterExpandingDuration: Duration(milliseconds: 500),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
