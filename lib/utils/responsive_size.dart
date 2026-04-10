import 'package:responsive_sizer/responsive_sizer.dart';

class ResponsiveSize {
  static double width(double value) {
    return Adaptive.w(value);
  }

  static double height(double value) {
    return value.h;
  }

  static double fontSize(double value) {
    return value.dp;
  }
}
