import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        _sideSpacing(context),
        _rightPart(),
        _sideSpacing(context),
      ],
    );
  }

  Widget _rightPart() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/tagneti_logo.png',
              height: 80,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          RichText(
            text: TextSpan(
              text: 'We are ',
              style: _getStyle(false),
              children: <TextSpan>[
                TextSpan(
                  text: 'Tagneti',
                  style: _getStyle(true),
                ),
                TextSpan(
                  text:
                      '. Your technology partner for innovative and impactful digital solutions.',
                  style: _getStyle(false),
                ),
                TextSpan(
                  text:
                      '\n\nWe proactively consult, design, develop and scale robust web, mobile and custom software solutions, that fuel innovation and deliver ',
                  style: _getStyle(false),
                ),
                TextSpan(
                  text: 'digital success',
                  style: _getStyle(true),
                ),
                TextSpan(
                  text: '!',
                  style: _getStyle(false),
                ),
                TextSpan(
                  text: '\n\nOur ',
                  style: _getStyle(false),
                ),
                TextSpan(
                  text: 'services',
                  style: _getStyle(true),
                ),
                TextSpan(
                  text:
                      ' include Mobile App Solutions, Web Design & Development, UX/UI Design and Custom Software Development.',
                  style: _getStyle(false),
                ),
                TextSpan(
                  text: '\n\nOur work does the talking. We have ',
                  style: _getStyle(false),
                ),
                TextSpan(
                  text: 'clients',
                  style: _getStyle(true),
                ),
                TextSpan(
                  text:
                      ' in 10+ countries with over 25+ projects completed successfully. We have the honour of having 100% positive feedback from our clients.\n\n',
                  style: _getStyle(false),
                ),
                TextSpan(
                    text: 'Contact',
                    style: _getStyle(true, underline: true),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        try {
                          launch(_emailLaunchUri.toString());
                        } catch (e) {
                          print('Exception - $e');
                        }
                      }),
                TextSpan(
                  text: ' us to start a project.',
                  style: _getStyle(false),
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          // OutlinedButton(
          //   style: OutlinedButton.styleFrom(
          //       // shadowColor: Theme.of(context).accentColor.withOpacity(0.4),
          //       side: BorderSide(
          //           width: 0.8, color: Theme.of(context).accentColor),
          //       padding: EdgeInsets.symmetric(horizontal: 48, vertical: 26)),
          //   onPressed: () {
          //     try {
          //       launch(_emailLaunchUri.toString());
          //     } catch (e) {
          //       print('Exception - $e');
          //     }
          //   },
          //   child: Text(
          //     'Get in Touch',
          //     style: TextStyle(
          //         color: Theme.of(context).accentColor,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w200),
          //   ),
          // ),
        ],
      ),
      flex: 10,
    );
  }

  Flexible _sideSpacing(BuildContext context) {
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

  _getStyle(bool isKeyWord, {bool underline = false}) {
    return Theme.of(context).textTheme.headline5?.copyWith(
          fontWeight: isKeyWord ? FontWeight.bold : FontWeight.w100,
          color: isKeyWord
              ? MyTheme.highlightedTextColor
              : MyTheme.normalTextColor,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
        );
  }
}
