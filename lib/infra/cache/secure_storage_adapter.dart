import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/cache/cache.dart';
import '../../data/errors/errors.dart';

class SecureStorageAdapter implements DeleteSecureCacheStorage, FetchSecureCacheStorage, SaveSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({required this.secureStorage});

  @override
  Future<void> delete({required String key}) async {
    try {
      await secureStorage.delete(key: key);
    } on CacheError {
      throw CacheError.deleteSecureData();
    }
  }

  @override
  Future<String> fetch({required String key}) async {
    try {
      return await secureStorage.read(key: key) ?? '';
    } on CacheError {
      throw CacheError.fetchSecureData();
    }
  }

  @override
  Future<void> save({required String key, required String value}) async {
    try {
      await secureStorage.write(key: key, value: value);
    } on CacheError {
      throw CacheError.saveSecureData();
    }
  }
}
