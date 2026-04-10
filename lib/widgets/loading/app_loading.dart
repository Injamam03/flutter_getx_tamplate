import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import '../../utils/app_size.dart';

Widget appLoading({double? width, double? height, Color? loaderColor}) {
  return Center(
    child: SizedBox(width: width ?? AppSize.width(value: 50), height: height ?? AppSize.width(value: 50), child: CircularProgressIndicator(color: loaderColor ?? ConstColor.customerPrimaryColor)),
  );
}
