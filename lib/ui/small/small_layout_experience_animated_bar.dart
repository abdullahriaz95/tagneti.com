import 'package:abdullahriaz95_dot_com/ar_theme.dart';
import 'package:abdullahriaz95_dot_com/bloc/experience/experience_bloc.dart';

import 'package:abdullahriaz95_dot_com/models/experience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallLayoutExperienceAnimatedBar extends StatefulWidget {
  @override
  _SmallLayoutExperienceAnimatedBarState createState() =>
      _SmallLayoutExperienceAnimatedBarState();
}

class _SmallLayoutExperienceAnimatedBarState
    extends State<SmallLayoutExperienceAnimatedBar> {
  double _leftPadding = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            Container(
              height: 1.5,
              width: 480,
              color: MyTheme.normalTextColor.withOpacity(0.5),
            ),
            AnimatedPadding(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
              padding: EdgeInsets.only(left: _leftPadding),
              child: Container(
                  height: 2, width: 120, color: Theme.of(context).accentColor),
            ),
            BlocListener<ExperienceBloc, ExperienceState>(
              listener: (context, expState) {
                _jumpToExperience((expState as ExperienceInitial).experience);
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  void _jumpToExperience(Experience experience) {
    switch (experience.companyName) {
      case 'Upwork':
        _leftPadding = 0;
        break;
      case 'Innowi':
        _leftPadding = 120;
        break;
      case 'Logicon':
        _leftPadding = 240;
        break;
      case 'Ozi Technology':
        _leftPadding = 360;
        break;
      default:
        _leftPadding = 0;
        break;
    }
  }
}
