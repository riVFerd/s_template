class AppError {
  final String message;

  const AppError(this.message);

  @override
  String toString() {
    return 'AppError{message: $message}';
  }
}