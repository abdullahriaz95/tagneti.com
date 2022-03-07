import 'package:flutter/material.dart';
import 'package:tagneti/ui/small/small_layout.dart';
import 'package:tagneti/widgets/responsive.dart';

import 'largeAndMedium/large_layout.dart';

//todo: add a navigation drawer
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // endDrawer: ResponsiveWidget.isSmallScreen(context)
      //     ? Container(
      //         height: MediaQuery.of(context).size.height,
      //         color: Theme.of(context).primaryColor.withOpacity(1),
      //         width: 250,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             GestureDetector(
      //               onTap: () {
      //                 BlocProvider.of<ScrollBloc>(context)
      //                     .add(ScrollToSectionEvent(sectionName: 'About'));
      //               },
      //               child: NavItem(
      //                 number: '01.',
      //                 text: 'About',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 32,
      //             ),
      //             GestureDetector(
      //               onTap: () {
      //                 BlocProvider.of<ScrollBloc>(context)
      //                     .add(ScrollToSectionEvent(sectionName: 'Experience'));
      //               },
      //               child: NavItem(
      //                 number: '02.',
      //                 text: 'Experience',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 32,
      //             ),
      //             GestureDetector(
      //               onTap: () {
      //                 BlocProvider.of<ScrollBloc>(context)
      //                     .add(ScrollToSectionEvent(sectionName: 'Work'));
      //               },
      //               child: NavItem(
      //                 number: '03.',
      //                 text: 'Work',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 32,
      //             ),
      //             GestureDetector(
      //               onTap: () {
      //                 BlocProvider.of<ScrollBloc>(context)
      //                     .add(ScrollToSectionEvent(sectionName: 'Contact'));
      //               },
      //               child: NavItem(
      //                 number: '04.',
      //                 text: 'Contact',
      //               ),
      //             ),
      //             SizedBox(
      //               height: 32,
      //             ),
      //           ],
      //         ),
      //       )
      //     : Container(),
      body: ResponsiveWidget(
        largeScreen: LargeAndMediumLayout(),
        mediumScreen: LargeAndMediumLayout(),
        smallScreen: SmallLayout(),
      ),
    );
  }
}
