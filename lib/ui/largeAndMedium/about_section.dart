import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tagneti/ar_theme.dart';
import 'package:tagneti/utilities/utils.dart';
import 'package:tagneti/widgets/heading.dart';
import 'package:tagneti/widgets/responsive.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          heading(context, '01.  ', 'About Us'),
          SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/i1.jpeg',
                  width: ResponsiveWidget.isMediumScreen(context) ? 200 : 300,
                  height: ResponsiveWidget.isMediumScreen(context) ? 200 : 400,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 32),
              _descriptivePart(context),
            ],
          ),
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _descriptivePart2(context),
              SizedBox(width: 32),
              Expanded(
                child: Image.asset(
                  'assets/images/i1.jpeg',
                  width: ResponsiveWidget.isMediumScreen(context) ? 200 : 300,
                  height: ResponsiveWidget.isMediumScreen(context) ? 200 : 400,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _descriptivePart(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '''We are a team of creative thinkers & makers...''',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.w100,
                        color: MyTheme.normalTextColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _descriptivePart2(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text:
                      '''And together we can make extraordinary things happen...''',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.w100,
                        color: MyTheme.normalTextColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
