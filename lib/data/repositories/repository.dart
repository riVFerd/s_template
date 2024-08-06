import 'package:fpdart/fpdart.dart';
import 'package:s_template/common/errors/api_exception.dart';
import 'package:s_template/common/errors/app_error.dart';
import 'package:s_template/common/network/network_info.dart';


/// Base class for all repository
class Repository {
  final NetworkInfo _networkInfo;

  Repository(this._networkInfo);

  /// [T] is return type either from [onSuccess] or [getOnLocal]
  /// [R] is return type from network call and param for [onSuccess] and [saveToLocal]
  /// throws [AppError] if something went wrong
  Future<Either<AppError, T>> handleNetworkCall<R, T>({
    required Future<R> call,
    required T Function(R data) onSuccess,
    Future<void> Function(R data)? saveToLocal,
    T? getOnLocal,
  }) async {
    if (await _networkInfo.isConnected()) {
      try {
        final data = await call;
        if (saveToLocal != null) saveToLocal(data);
        return right(onSuccess(data));
      } on ApiException catch(e) {
        return left(AppError(e.message));
      }
    } else {
      if (getOnLocal != null) {
        return right(getOnLocal);
      }
      return left(const AppError('No internet connection'));
    }
  }
}
