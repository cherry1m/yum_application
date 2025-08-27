// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_refreginator_ingredient_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateRefreginatorIngredientViewModelHash() =>
    r'1d46074fa022c4b92ba67f78ffdefb48cd0205d5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UpdateRefreginatorIngredientViewModel
    extends BuildlessAutoDisposeNotifier<UpdateRefreginatorIngredientState> {
  late final RefreginatorIngredient ingredient;

  UpdateRefreginatorIngredientState build(
    RefreginatorIngredient ingredient,
  );
}

/// See also [UpdateRefreginatorIngredientViewModel].
@ProviderFor(UpdateRefreginatorIngredientViewModel)
const updateRefreginatorIngredientViewModelProvider =
    UpdateRefreginatorIngredientViewModelFamily();

/// See also [UpdateRefreginatorIngredientViewModel].
class UpdateRefreginatorIngredientViewModelFamily
    extends Family<UpdateRefreginatorIngredientState> {
  /// See also [UpdateRefreginatorIngredientViewModel].
  const UpdateRefreginatorIngredientViewModelFamily();

  /// See also [UpdateRefreginatorIngredientViewModel].
  UpdateRefreginatorIngredientViewModelProvider call(
    RefreginatorIngredient ingredient,
  ) {
    return UpdateRefreginatorIngredientViewModelProvider(
      ingredient,
    );
  }

  @override
  UpdateRefreginatorIngredientViewModelProvider getProviderOverride(
    covariant UpdateRefreginatorIngredientViewModelProvider provider,
  ) {
    return call(
      provider.ingredient,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateRefreginatorIngredientViewModelProvider';
}

/// See also [UpdateRefreginatorIngredientViewModel].
class UpdateRefreginatorIngredientViewModelProvider
    extends AutoDisposeNotifierProviderImpl<
        UpdateRefreginatorIngredientViewModel,
        UpdateRefreginatorIngredientState> {
  /// See also [UpdateRefreginatorIngredientViewModel].
  UpdateRefreginatorIngredientViewModelProvider(
    RefreginatorIngredient ingredient,
  ) : this._internal(
          () =>
              UpdateRefreginatorIngredientViewModel()..ingredient = ingredient,
          from: updateRefreginatorIngredientViewModelProvider,
          name: r'updateRefreginatorIngredientViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateRefreginatorIngredientViewModelHash,
          dependencies:
              UpdateRefreginatorIngredientViewModelFamily._dependencies,
          allTransitiveDependencies: UpdateRefreginatorIngredientViewModelFamily
              ._allTransitiveDependencies,
          ingredient: ingredient,
        );

  UpdateRefreginatorIngredientViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ingredient,
  }) : super.internal();

  final RefreginatorIngredient ingredient;

  @override
  UpdateRefreginatorIngredientState runNotifierBuild(
    covariant UpdateRefreginatorIngredientViewModel notifier,
  ) {
    return notifier.build(
      ingredient,
    );
  }

  @override
  Override overrideWith(
      UpdateRefreginatorIngredientViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: UpdateRefreginatorIngredientViewModelProvider._internal(
        () => create()..ingredient = ingredient,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ingredient: ingredient,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UpdateRefreginatorIngredientViewModel,
      UpdateRefreginatorIngredientState> createElement() {
    return _UpdateRefreginatorIngredientViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateRefreginatorIngredientViewModelProvider &&
        other.ingredient == ingredient;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ingredient.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateRefreginatorIngredientViewModelRef
    on AutoDisposeNotifierProviderRef<UpdateRefreginatorIngredientState> {
  /// The parameter `ingredient` of this provider.
  RefreginatorIngredient get ingredient;
}

class _UpdateRefreginatorIngredientViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<
        UpdateRefreginatorIngredientViewModel,
        UpdateRefreginatorIngredientState>
    with UpdateRefreginatorIngredientViewModelRef {
  _UpdateRefreginatorIngredientViewModelProviderElement(super.provider);

  @override
  RefreginatorIngredient get ingredient =>
      (origin as UpdateRefreginatorIngredientViewModelProvider).ingredient;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
