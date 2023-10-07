class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error during commuinication :');
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? prefix])
      : super(message, 'Invaid request : ');
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([String? message])
      : super(message, 'UnAuthorised request: ');
}

class InValidInputException extends AppException {
  InValidInputException([String? message])
      : super(message, 'InValid request: ');
}
