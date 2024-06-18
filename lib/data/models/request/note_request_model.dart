// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteRequestModel {
  final String title;
  final String content;
  NoteRequestModel({
    required this.title,
    required this.content,
  });

  Map<String, String> toMap() {
    return <String, String>{
      'title': title,
      'content': content,
    };
  }
}
