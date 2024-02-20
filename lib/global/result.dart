class Result<T> {
  T? _value;
  ErrorResult? _error;

  Result.value(T value) {
    _value = value;
  }

  Result.error(ErrorResult error) {
    _error = error;
  }

  T? get value => _value;
  ErrorResult? get error => _error;

  bool get isValue => _value != null;
  bool get isError => _error != null;
}

class ErrorResult {
  final int code;
  final String? message;

  Exception? exception;

  ErrorResult(
    this.code,
    this.message, {
    this.exception,
  });
}