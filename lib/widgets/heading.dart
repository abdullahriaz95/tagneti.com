import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagneti/widgets/responsive.dart';

import '../ar_theme.dart';

Widget heading(BuildContext context, String number, String text) {
  return Row(
    children: [
      RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: number,
              style: GoogleFonts.ubuntu(
                  fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 28,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).accentColor)),
          TextSpan(
            text: text,
            style: GoogleFonts.montserrat(
                color: MyTheme.highlightedTextColor,
                fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 28,
                fontWeight: FontWeight.w600),
          ),
        ]),
      ),
      SizedBox(
        width: 24,
      ),
      ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? Expanded(
              child: Container(
                height: 1,
                color: MyTheme.normalTextColor.withOpacity(0.3),
              ),
            )
          : Container(
              height: 1,
              width: 200,
              color: MyTheme.normalTextColor.withOpacity(0.3),
            ),
    ],
  );
}
