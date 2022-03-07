import 'package:abdullahriaz95_dot_com/widgets/crazy_animate_on_hover.dart';
import 'package:abdullahriaz95_dot_com/widgets/translate_on_hover.dart';
import 'package:flutter/material.dart';

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
