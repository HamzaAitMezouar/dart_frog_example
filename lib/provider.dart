import 'package:backend_flutter/mysql.dart';
import 'package:dart_frog/dart_frog.dart';

final _mysql = MySQL();

Middleware mysqlProvder() {
  return (handler) {
    return handler.use(provider<MySQL>((_) => _mysql));
  };
}
