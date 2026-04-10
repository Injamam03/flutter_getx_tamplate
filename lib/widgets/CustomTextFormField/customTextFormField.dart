import 'package:flutter/material.dart';
import '../../constant/app_colors.dart';
import '../../utils/app_size.dart';
import '../custom_text/custom_text.dart';


class CustomTextFormField extends StatelessWidget {
  final bool numeric;
  final String fromTitle;
  final Widget? hintText;
  final int maxLine;
  final int? minLines;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final double? borderRadius;
  final AutovalidateMode? autoValidateMode;
  final BoxConstraints? prefixIconConstraints;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? suffixText;
  final Color? suffixTextColor;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool? enabled;

  const CustomTextFormField({
    super.key,
    this.fromTitle = "",
    this.numeric = false,
    this.hintText,
    this.maxLine = 1,
    this.minLines,
    this.backgroundColor,
    this.textController,
    this.validator,
    this.autoValidateMode,
    this.prefixIcon,
    this.borderRadius,
    this.prefixIconConstraints,
    this.textInputAction,
    this.focusNode,
    this.keyboardType,
    this.suffixText,
    this.suffixTextColor,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fromTitle == ''
              ? const SizedBox.shrink()
              : CustomText(
            top: 0,
            bottom: 2,
            title: fromTitle,
            textSize: AppSize.width(value: 16),
            fontWeight: FontWeight.w600,
          ),
          TextFormField(
            style: TextStyle(
              color: ConstColor.black,
              fontSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              decorationThickness: 0,
            ),
            focusNode: focusNode,
            validator: validator ??
                    (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
            controller: textController,
            minLines: minLines,
            maxLines: maxLine,
            textInputAction: textInputAction ?? TextInputAction.done,
            keyboardType: keyboardType ?? (numeric ? TextInputType.number : null),
            cursorColor: ConstColor.customerPrimaryColor,
            onChanged: onChanged,
            obscureText: obscureText,
            readOnly: readOnly,
            onTap: onTap,
            autovalidateMode: autoValidateMode,
            enabled: enabled,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixIconConstraints,
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints,
              suffixText: suffixText,
              suffixStyle: TextStyle(
                color: suffixTextColor ?? ConstColor.grey600,
                fontSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w500,
              ),
              filled: backgroundColor != null,
              fillColor: backgroundColor,
              hoverColor: ConstColor.customerPrimaryColor,
              label: hintText,
              hintStyle: TextStyle(
                color: ConstColor.grey600,
                fontSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ConstColor.grey600),
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: ConstColor.grey600),
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
              errorStyle: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}