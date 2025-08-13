import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum SpinKitType { wave, circle }

class SpinKitIndicator extends StatelessWidget {
  const SpinKitIndicator({
    super.key,
    this.type = SpinKitType.wave, this.sizes,
  });
  final bool? sizes;
  final SpinKitType type;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (type) {
      case SpinKitType.wave:
        widget = const SpinKitWave(
          color: Color(0xFF007C8C),
          size: 30.0,
        );
        break;
      case SpinKitType.circle:
        widget =  SpinKitFadingCircle(
          color: Color(0xFF007C8C),
          size:sizes==true?15: 30.0,
        );
    }
    return Center(child: widget);
  }
}
