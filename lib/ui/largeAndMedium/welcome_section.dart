import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ar_theme.dart';

class WelcomeSection extends StatefulWidget {
  @override
  _WelcomeSectionState createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _leftPart(context),
        _rightPart(),
      ],
    );
  }

  Flexible _rightPart() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'Hi,  my  name  is',
            style: GoogleFonts.ubuntu(color: Theme.of(context).accentColor),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Abdullah Riaz.',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'I build things for mobile.',
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: MyTheme.normalTextColor),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 500,
            child: Text(
              'I\'m a Software Engineer based in Lahore, PK specializing in building (and occasionally designing) exceptional mobile applications in Flutter.',
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(height: 1.5),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                // shadowColor: Theme.of(context).accentColor.withOpacity(0.4),
                side: BorderSide(
                    width: 0.8, color: Theme.of(context).accentColor),
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 26)),
            onPressed: () {
              try {
                launch(_emailLaunchUri.toString());
              } catch (e) {
                print('Exception - $e');
              }
            },
            child: Text(
              'Get in Touch',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w200),
            ),
          ),
        ],
      ),
      flex: 6,
    );
  }

  Flexible _leftPart(BuildContext context) {
    return Flexible(
      child: Container(),
      flex: 1,
    );
  }

  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'abdullahriaz95@gmail.com',
    queryParameters: {'subject': 'Inquiry From abdullahriaz95.com'},
  );
}
