import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:possapp/core/constants/variables.dart';
import 'package:possapp/data/datasource/auth_local_datasource.dart';
import 'package:possapp/data/models/request/note_request_model.dart';
import 'package:possapp/data/models/response/add_note_response_model.dart';
import 'package:possapp/data/models/response/note_respon_model.dart';

class NoteRemoteDatasource {
  Future<Either<String, NoteResponseModel>> getNote() async {
    try {
      final authData = await AuthLocalDataSource().getAuthData();
      final userId =
          authData.user.id; // Mendapatkan ID pengguna dari data autentikasi
      print('Fetching notes for user_id: $userId'); // Logging ID pengguna

      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/notes/user/$userId'),
        headers: {
          'Authorization': 'Bearer ${authData.token}',
        },
      );

      print('API response status: ${response.statusCode}');
      print('API response body: ${response.body}');

      if (response.statusCode == 200) {
        return right(NoteResponseModel.fromJson(response.body));
      } else {
        return left('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      return left('Exception: ${e.toString()}');
    }
  }

  Future<Either<String, AddNoteResponseModel>> addNote(
      NoteRequestModel noteRequestModel) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${authData.token}',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${Variables.baseUrl}/api/notes'),
    );

    request.fields.addAll(noteRequestModel.toMap());
    request.headers.addAll(headers); // Add headers to request

    // Uncomment this if you are adding an image
    // request.files.add(await http.MultipartFile.fromPath(
    //     'image', NoteRequestModel.image.path));

    http.StreamedResponse response = await request.send();
    final String body = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return right(AddNoteResponseModel.fromJson(body));
    } else {
      return left(body);
    }
  }

  Future<Either<String, void>> deleteNote(int noteId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.delete(
      Uri.parse('${Variables.baseUrl}/api/notes/delete/$noteId'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 204) {
      return right(null);
    } else {
      return left('Error: ${response.statusCode} - ${response.body}');
    }
  }

  Future<Either<String, Note>> updateNote(Note note) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.put(
      Uri.parse('${Variables.baseUrl}/api/notes/edit/${note.id}'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Content-Type': 'application/json',
      },
      body: note.toJson(), 
    );

    if (response.statusCode == 200) {
      return right(Note.fromJson(response.body));
    } else {
      return left('Error: ${response.statusCode} - ${response.body}');
    }
  }
}
