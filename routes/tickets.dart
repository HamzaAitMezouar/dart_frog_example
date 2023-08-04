import 'dart:convert';
import 'dart:developer';

import 'package:backend_flutter/mysql.dart';
import 'package:backend_flutter/ticket_model.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final mysql = context.read<MySQL>();
  if (context.request.method != HttpMethod.get) {
    if (context.request.method == HttpMethod.post) {
      var body = await context.request.body();
      TicketDelayModel ticket;
      var decodedJson = jsonDecode(body);
      ticket = TicketDelayModel(
          ref: decodedJson["ref"], userId: decodedJson["user_id"]);

      try {
        print("Before ADD");
        await mysql.addTicket(ticket);
        print("AFTER ADD");
      } catch (e) {
        return Response(body: "ERROR");
      } finally {
        return Response(body: 'Success');
      }
    }
  }

  var res = await mysql.getTickets();
  //print(res);
  return Response.json(
    body: {"message": "TEST", "data": res},
  );
}
