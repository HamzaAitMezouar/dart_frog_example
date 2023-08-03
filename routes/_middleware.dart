import 'package:backend_flutter/provider.dart';
import 'package:dart_frog/dart_frog.dart';

int _count = 0;

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(mysqlProvder());
}