import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tagneti/utilities/utils.dart';
import 'package:tagneti/widgets/nav_item.dart';

import 'logo.dart';

class TopNavBar extends StatefulWidget {
  final Function scrollTo;
  TopNavBar(this.scrollTo);

  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 24, bottom: 24, left: 32, right: 32),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  widget.scrollTo.call('Welcome');
                },
                child: Logo()),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                widget.scrollTo.call('About');
              },
              child: NavItem(
                number: '01.',
                text: 'About',
              ),
            ),
            SizedBox(
              width: 32,
            ),
            GestureDetector(
              onTap: () {
                widget.scrollTo.call('Experience');
              },
              child: NavItem(
                number: '02.',
                text: 'Experience',
              ),
            ),
            SizedBox(
              width: 32,
            ),
            GestureDetector(
              onTap: () {
                widget.scrollTo.call('Work');
              },
              child: NavItem(
                number: '03.',
                text: 'Work',
              ),
            ),
            SizedBox(
              width: 32,
            ),
            GestureDetector(
              onTap: () {
                widget.scrollTo.call('Contact');
              },
              child: NavItem(
                number: '04.',
                text: 'Contact',
              ),
            ),
            SizedBox(
              width: 32,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 0.8, color: Theme.of(context).accentColor),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18)),
              onPressed: () {
                Utils.launchURL(Utils.resumeLink);
              },
              child: Text(
                'Resume',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
