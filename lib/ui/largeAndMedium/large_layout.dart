import 'package:flutter/material.dart';
import 'package:tagneti/ui/largeAndMedium/main_content.dart';
import 'package:tagneti/ui/largeAndMedium/stack_left_navigation.dart';
import 'package:tagneti/ui/largeAndMedium/stack_right_navigation.dart';

class LargeAndMediumLayout extends StatefulWidget {
  @override
  _LargeAndMediumLayoutState createState() => _LargeAndMediumLayoutState();
}

class _LargeAndMediumLayoutState extends State<LargeAndMediumLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainLargeMediumContent(),
        // Positioned(
        //   child: StackLeftNavigation(),
        //   left: 40,
        //   bottom: 0,
        // ),
        // Positioned(
        //   child: StackRightNavigation(),
        //   right: 40,
        //   bottom: 0,
        // ),
      ],
    );
  }
}
