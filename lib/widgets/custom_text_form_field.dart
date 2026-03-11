import 'package:flutter/material.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.height,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final double? height;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => SizedBox(
        width: width ?? double.maxFinite,
        height: height ?? double.maxFinite,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          //style: textStyle ?? AppTypography.gabaritoDark15,
          obscureText: obscureText!,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: decoration,
          validator: validator,
          cursorColor: AppColors.colorSecondary,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        //hintStyle: hintStyle ?? AppTypography.gabaritoDark15,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.v, horizontal: 8.h),
          // Adjust as needed
          child: prefix,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 40.h,
          minHeight: 40.v,
        ),
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12.v),
        fillColor: fillColor ?? AppColors.colorAccent,
        filled: filled,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColors.colorAccent, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColors.colorAccent, width: 1.0)),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outline6 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.h),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
        borderRadius: BorderRadius.circular(24.h),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get outlineBlackTL29 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(29.h),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get outlineBlackTL291 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(29.h),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get gradientPrimaryToOnError => OutlineInputBorder(
        borderRadius: BorderRadius.circular(19.h),
        borderSide: BorderSide.none,
      );
}
