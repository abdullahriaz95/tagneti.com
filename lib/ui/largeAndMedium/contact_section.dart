import 'package:abdullahriaz95_dot_com/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _heading(context),
          SizedBox(
            height: 24,
          ),
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headline1.copyWith(
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 30 : 50),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 500,
            child: Text(
              'I am currently looking for new opportunities and my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get back to you!',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  height: 1.5,
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                    width: 0.8, color: Theme.of(context).accentColor),
                padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWidget.isSmallScreen(context) ? 28 : 32,
                    vertical:
                        ResponsiveWidget.isSmallScreen(context) ? 16 : 26)),
            onPressed: () {
              print('sending email to');
              try {
                launch(_emailLaunchUri.toString());
              } catch (e) {
                print('Exception - $e');
              }
            },
            child: Text(
              'Say Hello',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w200),
            ),
          ),
          ResponsiveWidget.isMediumScreen(context) ||
                  ResponsiveWidget.isLargeScreen(context)
              ? SizedBox(height: 60)
              : Container(),
          ResponsiveWidget.isMediumScreen(context) ||
                  ResponsiveWidget.isLargeScreen(context)
              ? Text(
                  'Built by Abdullah Riaz in Flutter',
                  style: Theme.of(context).textTheme.bodyText2,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Text(
      '04.  What\'s Next?',
      style: GoogleFonts.ubuntu(
          fontSize: 18,
          fontWeight: FontWeight.w100,
          color: Theme.of(context).accentColor),
    );
  }

  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'abdullahriaz95@gmail.com',
      queryParameters: {'subject': 'Inquiry From abdullahriaz95.com'});
}
