import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../utils/responsive_size.dart';
import '../texts/custom_text_widget.dart';

enum ButtonType { elevated, icon, text, normal }

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    this.height = 50,
    this.width = double.infinity,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.fontSize = 16,
    required this.ontap,
    this.backgroundColor,
    this.borderColor,
  }) : buttonType = ButtonType.elevated;
  ButtonWidget.normal({
    super.key,
    required this.text,
    this.height,
    this.width = double.infinity,
    this.margin,
    this.textColor,
    this.fontSize,
    this.backgroundColor,
    this.borderColor,
    required this.ontap,
  }) : buttonType = ButtonType.normal;
  ButtonWidget.icon({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.iconColor,
    this.scale,
    required this.icon,
    required this.ontap,
    this.flag = false,
  }) : buttonType = ButtonType.icon;
  ButtonWidget.text({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.margin,
    this.textColor,
    this.fontSize,
    this.fontWeight = FontWeight.w400,
    this.textDecoration,
    required this.ontap,
  }) : buttonType = ButtonType.text;
  String? text;
  bool flag = false;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  Color? textColor;
  double? fontSize;
  TextDecoration? textDecoration;
  final void Function()? ontap;
  String? icon;
  ButtonType buttonType;
  Color? borderColor;
  Color? backgroundColor;
  Color? iconColor;
  double? scale;
  FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.icon) {
      return InkWell(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        onTap: ontap,
        child:
            flag == false
                ? Image.asset(
                  icon!,
                  height: height,
                  width: width,
                  color: iconColor,
                  scale: scale,
                )
                : Icon(Icons.arrow_back),
      );
    }
    if (buttonType == ButtonType.text) {
      return InkWell(
        onTap: ontap,
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        child: TextWidget(
          text: text!,
          fontSize: fontSize,
          fontColor: textColor,
          fontWeight: fontWeight,
          textDecoration: textDecoration ?? TextDecoration.none,
        ),
      );
    }
    if (buttonType == ButtonType.normal) {
      return InkWell(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        onTap: ontap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          margin: margin ?? EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          width: ResponsiveSize.width(width ?? double.infinity),
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ?? const Color.fromARGB(0, 255, 255, 255),
            border: Border.all(color: borderColor ?? ConstColor.white),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              text!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor ?? ConstColor.grey700,
                fontSize: fontSize ?? 16,
                fontFamily: 'SFPro',
              ),
            ),
          ),
        ),
      );
    }
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: ontap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: ResponsiveSize.width(width ?? double.infinity),
        height: height,
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: borderColor ?? Colors.black),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: fontWeight,
                  color: textColor ?? ConstColor.white,
                  fontFamily: 'SFPro',
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
