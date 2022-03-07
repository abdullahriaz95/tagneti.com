import 'package:flutter/material.dart';
import 'package:tagneti/widgets/crazy_animate_on_hover.dart';
import 'package:tagneti/widgets/translate_on_hover.dart';

extension HoverExtensions on Widget {
  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }

  Widget get crazyAnimationOnHover {
    return CrazyAnimateOnHover(
      child: this,
    );
  }
}
