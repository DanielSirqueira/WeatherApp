export 'error.dart';

abstract class SystemError implements Exception {
  SystemError(message);
}

class InvalidTextError extends SystemError {
  InvalidTextError(super.message);
}

class DatasourceError extends SystemError {
  DatasourceError({String message = 'Error no Datasource'})
      : super(message = message);
}
