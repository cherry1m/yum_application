import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    log('Provider $provider was initialized with $value');

    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    log('Provider $provider was disposed');

    super.didDisposeProvider(provider, container);
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    log(
      'Provider $provider updated from $previousValue to $newValue',
    );
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    log('Provider $provider threw $error at $stackTrace');

    super.providerDidFail(provider, error, stackTrace, container);
  }
}
