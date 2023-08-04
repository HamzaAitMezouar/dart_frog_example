// To parse this JSON data, do
//
//     final ticketDelayModel = ticketDelayModelFromJson(jsonString);

import 'dart:convert';

String ticketDelayModelToJson(TicketDelayModel data) =>
    json.encode(data.toJson());

class TicketDelayModel {
  var id;
  var ref;
  var delay;
  var longitude;
  var latitude;
  var startDate;
  var endDate;
  var userId;
  var userName;

  TicketDelayModel({
    this.id,
    this.ref,
    this.delay,
    this.longitude,
    this.latitude,
    this.startDate,
    this.endDate,
    this.userId,
    this.userName,
  });

  factory TicketDelayModel.fromJson(Map<String, dynamic> json) =>
      TicketDelayModel(
        id: json['id'],
        ref: json['ref'],
        delay: json['delay'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        startDate: json['start_date'].toString(),
        endDate: json['end_date'].toString(),
        userId: json['user_id'],
        userName: json['user_name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ref': ref,
        'delay': delay,
        'longitude': longitude,
        'latitude': latitude,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
        'user_id': userId,
        'user_name': userName,
      };
}
