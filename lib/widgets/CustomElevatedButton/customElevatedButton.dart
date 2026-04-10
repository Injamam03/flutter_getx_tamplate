import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  final double height;
  final double fontSize;
  final double? width;
  final double top;
  final double right;
  final double left;
  final double bottom;
  final FontWeight fontWeight;
  final double horizontal;
  final bool isoutLined;
  final double buttonBorderRadius;
  final double vertical;
  final Color outLineColour;
  final double? borderWidth;
  final double? elevation;
  final Color? borderColor;
  final List<Color>? gradient;
  final Widget? icon;
  final double iconGap;

  const CustomElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.color = ConstColor.customerPrimaryColor,
    this.height = 56,
    this.fontSize = 12,
    this.width,
    this.top = 12,
    this.right = 0,
    this.left = 0,
    this.bottom = 0,
    this.fontWeight = FontWeight.w400,
    this.horizontal = 20,
    this.isoutLined = false,
    this.buttonBorderRadius = 12,
    this.vertical = 0,
    this.outLineColour = ConstColor.customerPrimaryColor,
    this.borderWidth,
    this.elevation,
    this.borderColor,
    this.gradient,
    this.icon,
    this.iconGap = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasGradient = gradient != null && !isoutLined;

    return Padding(
      padding: EdgeInsets.only(top: top, right: right, left: left, bottom: bottom),
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: hasGradient
            ? BoxDecoration(
          gradient: LinearGradient(
            colors: gradient!,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(buttonBorderRadius),
          boxShadow: [
            if (elevation != null && elevation! > 0)
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
          ],
        )
            : null,
        child: ElevatedButton(
          onPressed: onPressed ?? () => print("Elevated Button Pressed"),
          style: (isoutLined)
              ? _outlinedButtonStyle(
            fontSize,
            fontWeight,
            width ?? double.infinity,
            height,
            buttonBorderRadius,
            vertical,
            horizontal,
            outLineColour,
            borderWidth,
            elevation,
            borderColor,
          )
              : _filledButtonStyle(
            hasGradient ? Colors.transparent : color,
            fontSize,
            fontWeight,
            width ?? double.infinity,
            height,
            buttonBorderRadius,
            vertical,
            horizontal,
            hasGradient ? 0 : elevation,
            borderColor,
            borderWidth,
          ),
          child: icon != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24, width: 24, child: icon),
              SizedBox(width: iconGap),
              Flexible(child: child),
            ],
          )
              : child,
        ),
      ),
    );
  }
}

ButtonStyle _outlinedButtonStyle(
    double fontSize,
    FontWeight fontWeight,
    double width,
    double height,
    double buttonBorderRadius,
    double vertical,
    double horizontal,
    Color outLineColour,
    double? borderWidth,
    double? elevation,
    Color? borderColor,
    ) {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: outLineColour,
    // textStyle: GoogleFonts.poppins(
    //     fontSize: fontSize, fontWeight: fontWeight, textStyle: TextStyle()),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
      side: BorderSide(
        width: borderWidth ?? 1,
        color: borderColor ?? outLineColour,
      ),
    ),
    minimumSize: Size(width, height),
    elevation: elevation,
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
  );
}

ButtonStyle _filledButtonStyle(
    Color? color,
    double fontSize,
    FontWeight fontWeight,
    double width,
    double height,
    double buttonBorderRadius,
    double vertical,
    double horizontal,
    double? elevation,
    Color? borderColor,
    double? borderWidth,
    ) {
  return ElevatedButton.styleFrom(
    backgroundColor: color,
    shadowColor: Colors.transparent,
    foregroundColor: ConstColor.black,


    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
      side: borderColor != null
          ? BorderSide(color: borderColor, width: borderWidth ?? 1)
          : BorderSide.none,
    ),

    minimumSize: Size(width, height),
    elevation: elevation,
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
  );
}
