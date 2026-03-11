import 'package:flutter/material.dart';

import '../core/utils/size_utils.dart';
import '../theme/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
    key: key,
  );

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: iconButtonWidget,
    )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        height: height ?? 0,
        width: width ?? 0,
        padding: padding ?? EdgeInsets.zero,
        decoration: decoration ??
            BoxDecoration(
              color: AppColors.colorSecondary,
              borderRadius: BorderRadius.circular(25.h),
            ),
        child: child,
      ),
      onPressed: onTap,
    ),
  );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: AppColors.colorSecondary,
    borderRadius: BorderRadius.circular(20.h),
    boxShadow: [
      BoxShadow(
        color: AppColors.colorSecondary,
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          6,
          6,
        ),
      ),
    ],
  );
  static BoxDecoration get fillBlue => BoxDecoration(
    color: AppColors.colorSecondary,
    borderRadius: BorderRadius.circular(25.h),
  );
}