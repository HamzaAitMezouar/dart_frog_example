import 'dart:developer';

import 'package:backend_flutter/ticket_model.dart';
import 'package:mysql1/mysql1.dart';

class MySQL {
  ConnectionSettings settings = ConnectionSettings();

  Future<MySqlConnection?> openDb() async {
    MySqlConnection? conn = await MySqlConnection.connect(settings);
    return conn;
  }

  Future<List> getTickets() async {
    print("message");
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: "127.0.0.1",
      port: 3306,
      user: 'root',
      db: 'itop_app',
    ));

    final results = await conn.query('Select * FROM tickets_ticket');

    if (results.isNotEmpty) {
      var returnedField = [];
      for (ResultRow ticket in results) {
        //     print(ticket.fields.toString());
        returnedField.add(TicketDelayModel.fromJson(ticket.fields));
      }
      return returnedField;
    } else {
      return [];
    }
  }
}
