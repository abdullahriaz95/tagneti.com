import 'package:abdullahriaz95_dot_com/utilities/utils.dart';
import 'package:abdullahriaz95_dot_com/widgets/heading.dart';
import 'package:abdullahriaz95_dot_com/widgets/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          heading(context, '01.  ', 'About Me'),
          SizedBox(
            height: 32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _leftPart(context),
              SizedBox(width: 32),
              MouseRegion(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Material(
                    elevation: 4,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          _hovered
                              ? Colors.transparent
                              : Theme.of(context).accentColor.withOpacity(0.5),
                          BlendMode.multiply),
                      child: Image.asset(
                        'assets/images/Abdullah.jpg',
                        width: ResponsiveWidget.isMediumScreen(context)
                            ? 200
                            : 300,
                        height: ResponsiveWidget.isMediumScreen(context)
                            ? 200
                            : 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Expanded _leftPart(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // SizedBox(
          //   height: 32,
          // ),
          RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text:
                      '''Hello! I\'m Abdullah, a software engineer based in Lahore, PK.

I enjoy creating elegant mobile apps. My goal is to always build products that provide pixel-perfect, performant experiences.

Shortly after graduating from ''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.7),
                ),
                TextSpan(
                  text: '''PUCIT''',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Utils.launchURL('https://pucit.edu.pk/');
                    },
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      height: 1.5, color: Theme.of(context).accentColor),
                ),
                TextSpan(
                  text: ''', I joined the engineering team at ''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.7),
                ),
                TextSpan(
                  text: '''Ozi Technology''',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Utils.launchURL('https://ozitechnology.com/');
                    },
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      height: 1.7, color: Theme.of(context).accentColor),
                ),
                TextSpan(
                  text:
                      '''. I have also worked with Silicon Valley based company ''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.7),
                ),
                TextSpan(
                  text: '''Innowi''',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Utils.launchURL('https://innowi.com/');
                    },
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      height: 1.5, color: Theme.of(context).accentColor),
                ),
                TextSpan(
                  text: ''' and startups like ''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.7),
                ),
                TextSpan(
                  text: '''Logicon''',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Utils.launchURL('https://logicon.tech/');
                    },
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      height: 1.7, color: Theme.of(context).accentColor),
                ),
                TextSpan(
                  text: '''.

Here are a few technologies I've been working with recently:''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(height: 1.7),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Icon(
                Icons.eco_rounded,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: 12),
              Text('Flutter', style: Theme.of(context).textTheme.bodyText2),
              SizedBox(width: 32),
              Icon(
                Icons.eco_rounded,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: 12),
              Text('Dart', style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.eco_rounded,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: 12),
              Text('Android', style: Theme.of(context).textTheme.bodyText2),
              SizedBox(width: 32),
              Icon(
                Icons.eco_rounded,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: 12),
              Text('AOSP', style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ],
      ),
    );
  }
}
