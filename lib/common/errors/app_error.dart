import 'package:fpdart/fpdart.dart';

class AppError {
  final String message;

  const AppError(this.message);

  @override
  String toString() => message;
}

/// Response type for the application
/// Return either an [AppError] or a [T]
typedef Response<T> = Either<AppError, T>;

/// Future response type for the application
typedef FutureResponse<T> = Future<Response<T>>;