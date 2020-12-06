class HttpErrorTypes {
  static const String serverNotFound = '__serverNotFound__';
  static const String unauthorized = '__unauthorized__';
  static const String invalidPayload = '__invalidPayload__';
  static const String unhandledError = '__unhandledError__';
}

class HttpError {
  final String type;

  HttpError({this.type});
}
