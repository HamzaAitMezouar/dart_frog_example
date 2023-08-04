import 'dart:developer';

import 'package:backend_flutter/mysql.dart';
import 'package:backend_flutter/ticket_model.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final mysql = context.read<MySQL>();
  if (context.request.method == HttpMethod.post) {
    var body = context.request.json();
    TicketDelayModel ticket;
    await body.then((value) async {
      ticket = TicketDelayModel(
          ref: value["ref"],
          userId: value["user_id"],
          longitude: value["longitude_start"]);
      try {
        print("Before ADD");
        await mysql.addTicket(ticket);
        print("AFTER ADD");
      } catch (e) {
        return Response(body: e.toString());
      } finally {
        return Response(body: 'Success');
      }
    });
  }

  var res = await mysql.getTickets();
  //print(res);
  return Response.json(
    body: {"message": "TEST", "data": res},
  );
}
