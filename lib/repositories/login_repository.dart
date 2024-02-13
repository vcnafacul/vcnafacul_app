import 'package:vcnafacul/entitys/user/auth.dart';
import 'package:vcnafacul/storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepository extends SecureStorage<Auth> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> deleteItem(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<Auth?> readAll() async {
    final savedItems = await _storage.readAll();
    return Auth.fromRead(savedItems);
  }

  @override
  Future<String?> readItem(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> saveAll(Auth data) async {
    final saveItems = data.toWrite();
    for (var item in saveItems.entries) {
      await _storage.write(key: item.key, value: item.value);
    }
  }
}
