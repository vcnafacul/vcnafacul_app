abstract class SecureData<T> {
  Map<String, String> toWrite();
  static T fromRead<T extends SecureData<T>>(Map<String, String> items) {
    throw UnimplementedError();
  }
}
