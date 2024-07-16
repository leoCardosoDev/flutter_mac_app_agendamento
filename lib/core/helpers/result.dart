sealed class Result<R, T> {
  const Result();
}

final class Success<R, T> extends Result<R, T> {
  final T object;
  const Success(this.object): super();
}

final class Failure<R, T> extends Result<R, T> {
  final R error;
  const Failure(this.error): super();
}