import 'package:equatable/equatable.dart';

import 'error.dart';

class Result<T> extends Equatable with SealedResult<T> {
  bool get isSuccessful => this is Success<T>;

  @override
  List<Object?> get props => [isSuccessful];
}

class Success<T> extends Result<T> {
  final T? data;

  Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Error<T> extends Result<T> {
  final ErrorType type;
  final String message;

  Error(this.type, this.message);

  bool get isTokenExpired => type == ErrorType.tokenExpired;

  @override
  List<Object?> get props => [type, message];
}

abstract class SealedResult<T> {
  R? when<R>({
    R Function(T?)? success,
    R Function(ErrorType, String)? error,
  }) {
    if (this is Success<T?>) {
      return success?.call(((this as Success).data));
    }
    if (this is Error<T>) {
      return error?.call((this as Error<T>).type, (this as Error<T>).message);
    }
    throw Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
