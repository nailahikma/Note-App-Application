import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:possapp/data/datasource/note_remote_datasource.dart';
import 'package:possapp/data/models/request/note_request_model.dart';
import 'package:possapp/data/models/response/note_respon_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';
part 'notes_bloc.freezed.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NoteRemoteDatasource _noteRemoteDataSource;
  late List<Note> notes;

  NotesBloc(this._noteRemoteDataSource) : super(const NotesState.initial()) {
    notes = [];

    on<_Fetch>((event, emit) async {
      emit(const NotesState.loading());
      final response = await _noteRemoteDataSource.getNote();
      response.fold(
        (l) => emit(NotesState.error(l)),
        (r) {
          notes = r.data;
          emit(NotesState.success(notes));
        },
      );
    });

    on<_AddNOte>((event, emit) async {
      emit(const NotesState.loading());
      final requestData = NoteRequestModel(
        title: event.note.title,
        content: event.note.content,
      );
      final response = await _noteRemoteDataSource.addNote(requestData);
      response.fold(
        (l) => emit(NotesState.error(l)),
        (r) {
          notes.add(r.data);
          emit(NotesState.success(List.from(notes)));
        },
      );
    });

    on<_DeleteNote>((event, emit) async {
      emit(const NotesState.loading());
      final response = await _noteRemoteDataSource.deleteNote(event.noteId);
      response.fold(
        (l) => emit(NotesState.error(l)),
        (r) {
          notes.removeWhere((note) => note.id == event.noteId);
          emit(NotesState.success(List.from(notes)));
        },
      );
    });

    on<_UpdateNote>((event, emit) async {
      emit(const NotesState.loading());
      final response = await _noteRemoteDataSource.updateNote(event.note);
      response.fold(
        (l) {
          emit(NotesState.error(l));
        },
        (r) {
          final updatedNote = r;
          final updatedNotes = state.maybeWhen<List<Note>>(
            success: (List<Note> notes) {
              return [
                for (final note in notes)
                  if (note.id == updatedNote.id) updatedNote else note,
              ];
            },
            orElse: () => [],
          );
          emit(NotesState.success(updatedNotes));
        },
      );
    });
  }
}
