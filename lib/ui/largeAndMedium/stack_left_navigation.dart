import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tagneti/ar_theme.dart';
import 'package:tagneti/extensions/hover_extensions.dart';
import 'package:tagneti/utilities/utils.dart';

class StackLeftNavigation extends StatefulWidget {
  @override
  _StackLeftNavigationState createState() => _StackLeftNavigationState();
}

class _StackLeftNavigationState extends State<StackLeftNavigation> {
  String _hoverIconName = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            _focusShifted('upwork');
          },
          onExit: (_) {
            _focusShifted('');
          },
          child: GestureDetector(
            onTap: () {
              Utils.launchURL('https://www.upwork.com/fl/abdullahriaz22');
            },
            child: SvgPicture.asset('assets/icons/upwork.svg',
                height: 24,
                width: 24,
                fit: BoxFit.fitHeight,
                color: _hoverIconName == 'upwork'
                    ? Theme.of(context).accentColor
                    : MyTheme.normalTextColor),
          ),
        ).moveUpOnHover,
        SizedBox(height: 18),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _focusShifted('skype'),
          onExit: (_) => _focusShifted(''),
          child: GestureDetector(
            onTap: () {
              Utils.launchURL("https://join.skype.com/invite/dcWw3dAnlrhZ");
            },
            child: SvgPicture.asset('assets/icons/skype.svg',
                height: 24,
                width: 24,
                fit: BoxFit.fitHeight,
                color: _hoverIconName == 'skype'
                    ? Theme.of(context).accentColor
                    : MyTheme.normalTextColor),
          ),
        ).moveUpOnHover,
        SizedBox(height: 18),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => (_focusShifted('linkedin')),
          onExit: (_) => _focusShifted(''),
          child: GestureDetector(
            onTap: () {
              Utils.launchURL('https://www.linkedin.com/in/abdullahriaz95/');
            },
            child: SvgPicture.asset('assets/icons/linkedin.svg',
                height: 24,
                width: 24,
                fit: BoxFit.fitHeight,
                color: _hoverIconName == 'linkedin'
                    ? Theme.of(context).accentColor
                    : MyTheme.normalTextColor),
          ),
        ).moveUpOnHover,
        SizedBox(height: 18),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _focusShifted('github'),
          onExit: (_) => _focusShifted(''),
          child: GestureDetector(
            onTap: () {
              Utils.launchURL('https://github.com/abdullahriaz95');
            },
            child: SvgPicture.asset('assets/icons/github.svg',
                height: 24,
                width: 24,
                fit: BoxFit.fitHeight,
                color: _hoverIconName == 'github'
                    ? Theme.of(context).accentColor
                    : MyTheme.normalTextColor),
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

  _focusShifted(String s) {
    setState(() {
      _hoverIconName = s;
    });
  }
}
