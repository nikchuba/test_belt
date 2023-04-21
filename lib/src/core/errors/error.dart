abstract class IError {
  const IError(String body) : _body = body;
  final String _body;

  String get message;
}

class CacheError extends IError {
  const CacheError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Cache Error: ';
}

class DevicePlatformError extends IError {
  const DevicePlatformError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Platform Error: ';
}

class UnexpectedError extends IError {
  const UnexpectedError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Something went wrong...';
}
