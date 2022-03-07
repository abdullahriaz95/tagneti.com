import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Center(
          child: Text(
            'A',
            style: GoogleFonts.bitter(
              color: Theme.of(context).accentColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
