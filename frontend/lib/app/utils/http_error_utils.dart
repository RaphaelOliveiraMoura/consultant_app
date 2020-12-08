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

catchError(statusCode) {
  switch (statusCode) {
    case 404:
      throw new HttpError(type: HttpErrorTypes.serverNotFound);
    case 401:
      throw new HttpError(type: HttpErrorTypes.unauthorized);
    case 400:
      throw new HttpError(type: HttpErrorTypes.invalidPayload);
    case 500:
      throw new HttpError(type: HttpErrorTypes.unhandledError);
    default:
  }
}
