import 'dart:convert';

import 'package:possapp/data/models/response/note_respon_model.dart';


class AddNoteResponseModel {
  final bool success;
  final String message;
  final Note data;

  AddNoteResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AddNoteResponseModel.fromJson(String str) =>
      AddNoteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddNoteResponseModel.fromMap(Map<String, dynamic> json) =>
      AddNoteResponseModel(
        success: json["success"],
        message: json["message"],
        data: Note.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data.toMap(),
      };
}