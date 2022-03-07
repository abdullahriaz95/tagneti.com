import 'package:abdullahriaz95_dot_com/ar_theme.dart';
import 'package:abdullahriaz95_dot_com/bloc/experience/experience_bloc.dart';

import 'package:abdullahriaz95_dot_com/models/experience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceAnimatedBar extends StatefulWidget {
  @override
  _ExperienceAnimatedBarState createState() => _ExperienceAnimatedBarState();
}

class _ExperienceAnimatedBarState extends State<ExperienceAnimatedBar> {
  double topPadding = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 1.5,
          height: 160,
          color: MyTheme.normalTextColor.withOpacity(0.5),
        ),
        AnimatedPadding(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
          padding: EdgeInsets.only(top: topPadding),
          child: Container(
              width: 2, height: 40, color: Theme.of(context).accentColor),
        ),
        BlocListener<ExperienceBloc, ExperienceState>(
          listener: (context, expState) {
            _jumpToExperience((expState as ExperienceInitial).experience);
          },
          child: Container(),
        ),
      ],
    );
  }

  void _jumpToExperience(Experience experience) {
    switch (experience.companyName) {
      case 'Upwork':
        topPadding = 0;
        break;
      case 'Innowi':
        topPadding = 40;
        break;
      case 'Logicon':
        topPadding = 80;
        break;
      case 'Ozi Technology':
        topPadding = 120;
        break;
      default:
        topPadding = 0;
        break;
    }
  }
}
