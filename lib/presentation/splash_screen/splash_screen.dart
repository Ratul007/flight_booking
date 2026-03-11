
import 'package:flight_booking/presentation/splash_screen/state/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/size_utils.dart';
import '../../theme/app_colors.dart';
import 'notifier/splash_notifier.dart';


class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.listen(splashNotifierProvider, (previous, next) {
      next.whenData((state) {
        if (state == SplashState.loaded) {
          ref.read(splashNotifierProvider.notifier).navigateAfterSplash(context);
        }
      });
    });

    return Scaffold(
      body:  Container(
          width: double.infinity,
          height: SizeUtils.height,
        color: AppColors.colorPrimary,
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        )
      ));
  }
}
