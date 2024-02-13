abstract class SecureStorage<SecureData> {
  Future<void> saveAll(SecureData data);
  Future<SecureData?> readAll();
  Future<void> deleteItem(String key);
  Future<String?> readItem(String key);
  Future<void> clear();
}
