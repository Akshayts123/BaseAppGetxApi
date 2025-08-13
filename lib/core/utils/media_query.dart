import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MediaQueryUtil {
  final BuildContext context;
  MediaQueryUtil(this.context);
  double get height {
    return MediaQuery.of(context).size.width;
  }
  double get width {
    return MediaQuery.of(context).size.width;
  }
}