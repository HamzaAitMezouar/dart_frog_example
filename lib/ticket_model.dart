// To parse this JSON data, do
//
//     final ticketDelayModel = ticketDelayModelFromJson(jsonString);

import 'dart:convert';

String ticketDelayModelToJson(TicketDelayModel data) =>
    json.encode(data.toJson());

class TicketDelayModel {
  var id;
  var ref;

  var userId;
  var userName;

  TicketDelayModel({
    this.id,
    this.ref,
    this.userId,
    this.userName,
  });

  factory TicketDelayModel.fromJson(Map<String, dynamic> json) =>
      TicketDelayModel(
        id: json['id'],
        ref: json['ref'],
        userId: json['user_id'],
        userName: json['user_name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ref': ref,
        'user_id': userId,
        'user_name': userName,
      };
}
