import 'package:flutter_riverpod/flutter_riverpod.dart';

final initServiceProvider = Provider<InitService>((ref) => InitService());

class InitService {
  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate loading
    // Add real checks: auth, DB init, remote config etc.
  }
}
