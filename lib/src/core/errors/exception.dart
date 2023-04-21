abstract class IException implements Exception {
  IException(this.message);

  final String message;
}

class CacheException extends IException {
  CacheException(super.message);
}

class DevicePlatformException extends IException {
  DevicePlatformException(super.message);
}
