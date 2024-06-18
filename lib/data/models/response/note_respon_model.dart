// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NoteResponseModel {
  final bool success;
  final String message;
  final List<Note> data;

  NoteResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NoteResponseModel.fromJson(String str) {
    final jsonData = json.decode(str);
    return NoteResponseModel.fromMap(jsonData);
  }

  factory NoteResponseModel.fromMap(Map<String, dynamic> json) {
    return NoteResponseModel(
      success: json["success"] ?? false,
      message: json["message"] ?? '',
      data: json["data"] != null
          ? List<Note>.from(json["data"].map((x) => Note.fromMap(x)))
          : [],
    );
  }

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Note {
  final int? id;
  final int? userId;
  final String title;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Note({
    this.id,
    this.userId,
    required this.title,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Note.fromJson(String str) => Note.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Note.fromMap(Map<String, dynamic> json) {
    return Note(
      id: json["id"] is int ? json["id"] : null,
      userId: json["user_id"] is int ? json["user_id"] : null,
      title: json["title"] ?? '',
      content: json["content"] ?? '',
      createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : null,
      updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  Note copyWith({
    int? id,
    int? userId,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Note(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.title == title &&
        other.content == content &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        title.hashCode ^
        content.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
