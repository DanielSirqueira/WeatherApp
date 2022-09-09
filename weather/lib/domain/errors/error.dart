export 'error.dart';

abstract class SystemError implements Exception {}

class InvalidTextError implements SystemError {}

class DatasourceError implements SystemError {
  final String message;

  DatasourceError({this.message = 'Erro no Datasource'});
}
