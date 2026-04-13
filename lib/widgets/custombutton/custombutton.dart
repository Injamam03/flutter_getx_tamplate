import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  // ======== Layout =========
  final double height;
  final double width;

  // ========= Style =========
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle? textStyle;

  // ========= Border =========
  final bool hasBorder;
  final Color? borderColor;
  final double borderWidth;

  final Widget? icon;
  final double iconSize;
  final double iconSpacing;

  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding; //-=-=--=--==-=-=

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,

    // ======== Layout defaults =========
    this.height = 52,
    this.width = double.infinity,

    // ========= Style defaults =========
    this.backgroundColor = ConstColor.customerPrimaryColor,
    this.textColor = ConstColor.white,
    this.borderRadius = 30,
    this.textStyle,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth = 1.5,

    this.icon,
    this.iconSize = 24,
    this.iconSpacing = 10,

    this.fontSize = 16,
    this.fontWeight = FontWeight.w600, //=--=-==-=--==-=-=--==-=-=
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding!, //
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasBorder
                ? Border.all(
              color: borderColor ?? backgroundColor,
              width: borderWidth,
            )
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: icon,
                ),
                SizedBox(width: iconSpacing),
              ],
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      fontFamily: "SFPro",
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
