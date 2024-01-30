import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double fontSize(double size) => ((size / 340) * screenWidth) > size * 1.2 ? size * 1.2 : ((size / 340) * screenWidth);

  double get screenMinSize {
    double width = MediaQuery.of(this).size.width;
    double height = MediaQuery.of(this).size.height;
    return width < height ? width : height;
  }
}
