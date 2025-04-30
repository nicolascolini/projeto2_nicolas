// ignore: prefer_typing_uninitialized_variables
sealed; class Result <TOk, TError> {
  const Result();

  bool get isSuccess => this is Success;

  bool get isFailure => this is Error;

  TOk? get successValeuOrNull => 
    isSuccess ? (this as Success)._value : null;

  TError? get failureValueOrNull =>
    isFailure ? (this as Error)._value : null;

  R fold<R> ({
    required R Function(Success value) onSuccess,
    required R Function(Error error) onFailure,
  }) {
    if(this is Success) {
      return onSuccess((this is Success).value);
    }
    else if (this is Error) {
      return onFailure((this is Error).value);
    }
    throw Exception('Unreachable code');
  }
}

final class Success<TOk, TError> extends Result<TOk, TError> {
  final TOk _value;
  const Success(this._value);
}

final class Error<TOk, TError> extends Result<TOk, TError> {
  final TError _value;
  const Error(this._value);
}