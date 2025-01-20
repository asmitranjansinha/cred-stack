import 'package:flutter/material.dart';

class SizeUtils {
  final BuildContext context;

  SizeUtils(this.context);

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  /// Returns height as a percentage of the screen height.
  double heightPercentage(double percentage) {
    return screenHeight * (percentage / 100);
  }

  /// Returns width as a percentage of the screen width.
  double widthPercentage(double percentage) {
    return screenWidth * (percentage / 100);
  }
}

extension SizeExtensions on num {
  /// Returns a SizedBox with height as a percentage of screen height.
  Widget get heightBox => SizedBox(height: this.toDouble());

  /// Returns a SizedBox with width as a percentage of screen width.
  Widget get widthBox => SizedBox(width: this.toDouble());

  /// Returns scaled height based on the screen size.
  double scaledHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * (this / 100);
  }

  /// Returns scaled width based on the screen size.
  double scaledWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * (this / 100);
  }
}
