import 'package:abdullahriaz95_dot_com/ui/largeAndMedium/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abdullahriaz95_dot_com/bloc/scroll/scroll_bloc.dart';

class SmallLayoutTopNavBar extends StatefulWidget {
  final Function scrollTo;
  SmallLayoutTopNavBar(this.scrollTo);

  @override
  _SmallLayoutTopNavBarState createState() => _SmallLayoutTopNavBarState();
}

class _SmallLayoutTopNavBarState extends State<SmallLayoutTopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<ScrollBloc>(context)
                    .add(ScrollToSectionEvent(sectionName: 'Welcome'));
              },
              child: Logo(),
            ),
            Expanded(child: Container()),
            // MouseRegion(
            //   cursor: SystemMouseCursors.click,
            //   child: GestureDetector(
            //     onTap: () {
            //       Scaffold.of(context).openEndDrawer();
            //     },
            //     child: Icon(
            //       Icons.menu_open_rounded,
            //       size: 32,
            //       color: Theme.of(context).accentColor,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
