import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';


// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.textAlign,
    this.textDecoration = TextDecoration.none,
    this.decorationColor,
    this.decorationthickness,

  });

  TextWidget.header({
    super.key,
    required this.text,
    this.fontSize = 28,
    this.textAlign,
    this.fontColor = ConstColor.blue200,
    this.decorationColor,
    this.decorationthickness,


  }) : fontWeight = FontWeight.w600;

  TextWidget.blackLight({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.textAlign,
    this.fontColor = ConstColor.grey700,
    this.fontWeight = FontWeight.w400,
    this.decorationColor
    ,this.decorationthickness


  });

  TextWidget.black({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.textAlign,
    this.fontColor = ConstColor.black,
    this.fontWeight = FontWeight.w500,
    this.decorationColor
    ,this.decorationthickness

  });

  TextWidget.red({
    super.key,
    required this.text,
    this.fontSize = 0.25,
    this.textDecoration,
    this.textAlign,
    this.fontColor = ConstColor.riderRed,
    this.decorationColor,
    this.decorationthickness,
  }) : fontWeight = FontWeight.w400;

  TextWidget.white({
    super.key,
    required this.text,
    this.fontSize,
    this.textAlign,
    this.fontColor = ConstColor.blue200,
    this.fontWeight,
    this.decorationColor,
    this.decorationthickness,
  });

  TextWidget.greyish({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.textDecoration,
    this.textAlign,
    this.fontColor = ConstColor.blue200,
    this.decorationColor,
    this.decorationthickness,
  }) : fontWeight = FontWeight.w400;



  final String text;
  final double? fontSize;
  final Color? fontColor;
  FontWeight? fontWeight;
  TextDecoration? textDecoration;
  TextAlign? textAlign;
  final Color? decorationColor;
  final double? decorationthickness;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      softWrap: true,
      maxLines: null,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontFamily: 'SFPro',
        decoration: textDecoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
        decorationColor: decorationColor?? Colors.transparent,
        decorationThickness: decorationthickness?? 1,
      ),
    );
  }
}
