import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tagneti/ar_theme.dart';
import 'package:tagneti/extensions/hover_extensions.dart';

import 'package:url_launcher/url_launcher.dart';

class StackRightNavigation extends StatefulWidget {
  @override
  _StackRightNavigationState createState() => _StackRightNavigationState();
}

class _StackRightNavigationState extends State<StackRightNavigation> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              _hovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _hovered = false;
            });
          },
          child: GestureDetector(
            onTap: () {
              try {
                launch(_emailLaunchUri.toString());
              } catch (e) {
                print('Exception - $e');
              }
            },
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                'abdullahriaz95@gmail.com',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14,
                    color: _hovered
                        ? Theme.of(context).accentColor
                        : MyTheme.normalTextColor),
              ),
            ),
          ),
        ).moveUpOnHover,
        SizedBox(height: 18),
        Container(
          width: 1,
          height: 120,
          color: MyTheme.normalTextColor,
        )
      ],
    );
  }

  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'abdullahriaz95@gmail.com',
    queryParameters: {'subject': 'Inquiry From abdullahriaz95.com'},
  );
}
