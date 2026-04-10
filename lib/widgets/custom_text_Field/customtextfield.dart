import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_tamplete/constant/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final String? suffixText;
  final TextStyle? suffixTextStyle;

  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;

  final bool isOptional;
  final bool isEmail;
  final bool isPassWord;
  final bool isPassWordSecondValidation;
  final TextEditingController? isPassWordSecondValidationController;

  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? height;
  final double? width;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final bool underlineOnly; // NEW: Toggle between box and underline
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.onSuffixTap,
    this.suffixText,
    this.suffixTextStyle,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.isOptional = false,
    this.isEmail = false,
    this.isPassWord = false,
    this.isPassWordSecondValidation = false,
    this.isPassWordSecondValidationController,
    this.contentPadding,
    this.borderRadius = 100,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.height,
    this.width,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.underlineOnly = false,
    this.onTap,
    this.inputFormatters,
  });

  bool isValidEmail(String? email) {
    if (email == null) return false;
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        inputFormatters:
            maxLength != null
                ? [LengthLimitingTextInputFormatter(maxLength)]
                : inputFormatters,
        style: const TextStyle(fontSize: 16),
        validator:
            validator ??
            (value) {
              if (isOptional) return null;

              // Required check
              if (value == null || value.trim().isEmpty) {
                return "This field is required";
              }

              // Password length check
              if (isPassWord && value.length < 8) {
                return "Must be at least 8 characters.";
              }

              // Email validation
              if (isEmail) {
                if (isValidEmail(value)) return null;
                return "Please provide a valid email address";
              }

              // Confirm Password match
              if (isPassWord && isPassWordSecondValidation) {
                final originalPass = isPassWordSecondValidationController?.text;
                if (originalPass != null && value != originalPass) {
                  return "Both passwords must match";
                }
              }

              return null;
            },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              labelStyle ??
              TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 14.sp,
              ),
          floatingLabelStyle: TextStyle(
            color: focusedBorderColor ?? theme.colorScheme.primary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          hintText: hintText,
          hintStyle:
              hintStyle ??
              TextStyle(
                color: theme.colorScheme.onSurface.withOpacity(0.5),
                fontSize: 15.sp,
                fontFamily: "SFPro",
              ),
          helperText: helperText,
          errorText: errorText,
          errorStyle: errorStyle ?? TextStyle(color: theme.colorScheme.error),
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: fillColor != null || fillColor == ConstColor.grey600,
          fillColor: fillColor ?? ConstColor.grey600,

          prefixIcon:
              prefixIcon != null
                  ? SizedBox(
                    width: prefixIconSize ?? 48,
                    height: prefixIconSize ?? 48,
                    child: Center(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          prefixIconColor ?? ConstColor.grey600,
                          BlendMode.srcIn,
                        ),
                        child: prefixIcon,
                      ),
                    ),
                  )
                  : null,

          suffixIcon:
              (suffixIcon != null || suffixText != null)
                  ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (suffixIcon != null)
                          SizedBox(
                            width: suffixIconSize ?? 25,
                            height: suffixIconSize ?? 48,
                            child: Center(
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  suffixIconColor ?? ConstColor.black,
                                  BlendMode.srcIn,
                                ),
                                child: suffixIcon,
                              ),
                            ),
                          ),
                        if (suffixText != null)
                          Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Text(
                              suffixText!,
                              style:
                                  suffixTextStyle ??
                                  TextStyle(
                                    color: ConstColor.grey600,
                                    fontSize: 14,
                                    fontFamily: "SFPro",
                                  ),
                            ),
                          ),
                      ],
                    ),
                  )
                  : null,

          // UPDATED: Conditional border style
          border:
              underlineOnly
                  ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? ConstColor.grey600,
                      width: 1.2,
                    ),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: borderColor ?? ConstColor.grey600,
                      width: 1.2,
                    ),
                  ),
          enabledBorder:
              underlineOnly
                  ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? ConstColor.grey600,
                      width: 1.2,
                    ),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: borderColor ?? ConstColor.grey600,
                      width: 1.2,
                    ),
                  ),
          focusedBorder:
              underlineOnly
                  ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: focusedBorderColor ?? ConstColor.grey600,
                      width: 2,
                    ),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: focusedBorderColor ?? ConstColor.grey600,
                      width: 2,
                    ),
                  ),
          errorBorder:
              underlineOnly
                  ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: errorBorderColor ?? theme.colorScheme.error,
                      width: 2,
                    ),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: errorBorderColor ?? theme.colorScheme.error,
                      width: 2,
                    ),
                  ),
          focusedErrorBorder:
              underlineOnly
                  ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: errorBorderColor ?? theme.colorScheme.error,
                      width: 2,
                    ),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius!),
                    borderSide: BorderSide(
                      color: errorBorderColor ?? theme.colorScheme.error,
                      width: 2,
                    ),
                  ),
        ),
      ),
    );
  }
}
