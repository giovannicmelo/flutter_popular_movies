class ResponseHolder<T> {
  final int statusCode;
  final Exception exception;
  final T data;

  ResponseHolder({
    this.statusCode,
    this.exception,
    this.data,
  });
}
