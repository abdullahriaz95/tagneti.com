import 'package:flutter/material.dart';
import 'package:tagneti/ui/small/small_layout.dart';
import 'package:tagneti/widgets/responsive.dart';

import 'largeAndMedium/large_layout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ResponsiveWidget(
        largeScreen: LargeAndMediumLayout(),
        mediumScreen: LargeAndMediumLayout(),
        smallScreen: LargeAndMediumLayout(),
      ),
    );
  }
}
