import 'package:flutter/material.dart';
import 'dart:math' as math;

class CrazyAnimateOnHover extends StatefulWidget {
  final Widget child;
  CrazyAnimateOnHover({Key key, this.child}) : super(key: key);

  @override
  _CrazyAnimateOnHoverState createState() => _CrazyAnimateOnHoverState();
}

class _CrazyAnimateOnHoverState extends State<CrazyAnimateOnHover> {
  final nonHoverTransform = Matrix4.identity();
  // final hoverTransform = Matrix4.identity()..translate(3, 3, 0);
  final hoverTransform = Matrix4.identity()
    ..rotateY(math.pi / 120)
    ..rotateX(math.pi / 12)
    ..rotateZ(math.pi / 18);

  final double hoverHeight = 20;
  final double nonHoverHeight = 100;

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        // height: _hovering ? hoverHeight : nonHoverHeight,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
