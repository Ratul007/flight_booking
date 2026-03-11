import 'dart:developer' as Logger;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,
      ) {
    Logger.log(
      'Provider: ${provider.name ?? provider.runtimeType}, '
          'Previous: $previousValue, New: $newValue',
    );
  }

  @override
  void didAddProvider(
      ProviderBase provider,
      Object? value,
      ProviderContainer container,
      ) {
    Logger.log('Provider Added: ${provider.name ?? provider.runtimeType}, Value: $value');
  }

  @override
  void didDisposeProvider(
      ProviderBase provider,
      ProviderContainer container,
      ) {
    Logger.log('Provider Disposed: ${provider.name ?? provider.runtimeType}');
  }
}
