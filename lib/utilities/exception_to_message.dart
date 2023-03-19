import 'package:photolab/core/errors/exceptions.dart';

String exceptionToMessage(Exception exception) {
  if (exception is ServerException) {
    return 'Ошибка сервера';
  } else if (exception is InternetConnectionException) {
    return 'Нет подключения к интернету';
  } else {
    return 'Неизвестная ошибка';
  }
}
