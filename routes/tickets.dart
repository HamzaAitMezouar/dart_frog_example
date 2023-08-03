import 'dart:developer';

import 'package:backend_flutter/mysql.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final mysql = context.read<MySQL>();

  var res = await mysql.getTickets();
  //print(res);
  return Response.json(
    body: {"message": "TEST", "data": res},
  );
}
