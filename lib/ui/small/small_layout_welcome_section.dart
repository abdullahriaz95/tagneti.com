import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagneti/ar_theme.dart';
import 'package:tagneti/widgets/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class SmallLayoutWelcomeSection extends StatefulWidget {
  @override
  _SmallLayoutWelcomeSectionState createState() =>
      _SmallLayoutWelcomeSectionState();
}

class _SmallLayoutWelcomeSectionState extends State<SmallLayoutWelcomeSection> {
  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi,  my  name  is',
            style: GoogleFonts.ubuntu(color: Theme.of(context).accentColor),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Abdullah Riaz.',
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 40),
          ),
          Text(
            'I build things for mobile.',
            style: Theme.of(context).textTheme.headline1.copyWith(
                color: MyTheme.normalTextColor,
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 40),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            child: Text(
              'I\'m a Software Engineer based in Lahore, PK specializing in building (and occasionally designing) exceptional mobile applications in Flutter.',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  height: 1.5,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
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
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'abdullahriaz95@gmail.com',
    queryParameters: {'subject': 'Inquiry From abdullahriaz95.com'},
  );
}
