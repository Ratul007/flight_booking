import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {

  static ButtonStyle get outlineWhiteSmoke6 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorWhiteSmoke,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );

  static ButtonStyle get outlineSecondarySmoke6 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorSecondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
  );



  static ButtonStyle get outlineWhiteSmoke24 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorWhiteSmoke,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  static ButtonStyle get outlineSecondarySmoke24 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorSecondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );


  static ButtonStyle get outlineSecondary23 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorSecondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23),
    ),
  );

  static ButtonStyle get outlineAccent23 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23),
    ),
  );

  static ButtonStyle get outlinePrimary23 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23),
    ),
  );

  static ButtonStyle get outlineSecondary12 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorSecondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static ButtonStyle get outlineYellow12 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorSelectiveYellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static ButtonStyle get outlinePrimary12 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static ButtonStyle get outlineBlue23 => ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23),
    ),
  );

  static ButtonStyle get outlineSecondary16 => ElevatedButton.styleFrom(
    backgroundColor: AppColors.colorSecondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static ButtonStyle get none => ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
        elevation: WidgetStateProperty.all<double>(0),
      );
}
