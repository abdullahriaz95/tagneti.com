import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tagneti/utilities/utils.dart';

class SmallLayoutNavigationLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Utils.launchURL('https://www.upwork.com/fl/abdullahriaz22');
              },
              child: SvgPicture.asset('assets/icons/upwork.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fitHeight,
                  color: Theme.of(context).accentColor),
            ),
            SizedBox(width: 18),
            GestureDetector(
              onTap: () {
                Utils.launchURL("https://join.skype.com/invite/dcWw3dAnlrhZ");
              },
              child: SvgPicture.asset('assets/icons/skype.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fitHeight,
                  color: Theme.of(context).accentColor),
            ),
            SizedBox(width: 18),
            GestureDetector(
              onTap: () {
                Utils.launchURL('https://www.linkedin.com/in/abdullahriaz95/');
              },
              child: SvgPicture.asset('assets/icons/linkedin.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fitHeight,
                  color: Theme.of(context).accentColor),
            ),
            SizedBox(width: 18),
            GestureDetector(
              onTap: () {
                Utils.launchURL('https://github.com/abdullahriaz95');
              },
              child: SvgPicture.asset('assets/icons/github.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.fitHeight,
                  color: Theme.of(context).accentColor),
            ),
          ],
        ),
        SizedBox(height: 18),
        Text(
          'Built by Abdullah Riaz in Flutter',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
