import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/init_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_routes.dart';
import '../state/splash_state.dart'; // adjust import

final splashNotifierProvider =
AsyncNotifierProvider<SplashNotifier, SplashState>(() => SplashNotifier());

class SplashNotifier extends AsyncNotifier<SplashState> {
  @override
  Future<SplashState> build() async {
    try {
      await ref.read(initServiceProvider).initialize();

      await Future.delayed(const Duration(seconds: 3));

      return SplashState.loaded;
    } catch (e) {
      return SplashState.error;
    }
  }

  /// Call this safely from your widget for navigation
  Future<void> navigateAfterSplash(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (context.mounted) {
      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacementNamed(context, AppRoutes.splashScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.splashScreen);
      }
    }
  }
}
