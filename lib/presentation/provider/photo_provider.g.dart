// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPhotosHash() => r'039ae25c9440dbb43917537c4f4b825485f665a5';

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

/// See also [getPhotos].
@ProviderFor(getPhotos)
const getPhotosProvider = GetPhotosFamily();

/// See also [getPhotos].
class GetPhotosFamily extends Family<AsyncValue<List<PhotoModel>>> {
  /// See also [getPhotos].
  const GetPhotosFamily();

  /// See also [getPhotos].
  GetPhotosProvider call(
    int albumId,
  ) {
    return GetPhotosProvider(
      albumId,
    );
  }

  @override
  GetPhotosProvider getProviderOverride(
    covariant GetPhotosProvider provider,
  ) {
    return call(
      provider.albumId,
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
  String? get name => r'getPhotosProvider';
}

/// See also [getPhotos].
class GetPhotosProvider extends AutoDisposeFutureProvider<List<PhotoModel>> {
  /// See also [getPhotos].
  GetPhotosProvider(
    int albumId,
  ) : this._internal(
          (ref) => getPhotos(
            ref as GetPhotosRef,
            albumId,
          ),
          from: getPhotosProvider,
          name: r'getPhotosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPhotosHash,
          dependencies: GetPhotosFamily._dependencies,
          allTransitiveDependencies: GetPhotosFamily._allTransitiveDependencies,
          albumId: albumId,
        );

  GetPhotosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.albumId,
  }) : super.internal();

  final int albumId;

  @override
  Override overrideWith(
    FutureOr<List<PhotoModel>> Function(GetPhotosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPhotosProvider._internal(
        (ref) => create(ref as GetPhotosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        albumId: albumId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PhotoModel>> createElement() {
    return _GetPhotosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPhotosProvider && other.albumId == albumId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, albumId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPhotosRef on AutoDisposeFutureProviderRef<List<PhotoModel>> {
  /// The parameter `albumId` of this provider.
  int get albumId;
}

class _GetPhotosProviderElement
    extends AutoDisposeFutureProviderElement<List<PhotoModel>>
    with GetPhotosRef {
  _GetPhotosProviderElement(super.provider);

  @override
  int get albumId => (origin as GetPhotosProvider).albumId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
