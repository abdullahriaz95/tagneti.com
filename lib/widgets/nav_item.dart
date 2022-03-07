import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatefulWidget {
  final String number;
  final String text;
  NavItem({@required this.number, @required this.text});

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        hovered = true;
      }),
      onExit: (_) => setState(() {
        hovered = false;
      }),
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: '${widget.number}  ',
              style: GoogleFonts.ubuntu(color: Theme.of(context).accentColor)),
          TextSpan(
            text: widget.text,
            style: GoogleFonts.ubuntu(
                color: hovered
                    ? Theme.of(context).accentColor
                    : Colors.white.withOpacity(.8),
                fontWeight: FontWeight.w200),
          ),
        ]),
      ),
    );
  }
}
