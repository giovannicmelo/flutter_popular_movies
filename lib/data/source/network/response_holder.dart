class ResponseHolder<T> {
  final int statusCode;
  final Exception? exception;
  final T? data;

  ResponseHolder({
    this.statusCode = -1,
    this.exception,
    this.data,
  });
}
