import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../theme/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return  Center(
        child: LoadingAnimationWidget.beat(color: AppColors.colorSecondary, size: 40),
      );
    }
    return child;
  }
}
