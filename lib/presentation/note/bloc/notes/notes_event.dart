part of 'notes_bloc.dart';

@freezed
class NotesEvent with _$NotesEvent {
  const factory NotesEvent.started() = _Started;
  const factory NotesEvent.fetch() = _Fetch;
  const factory NotesEvent.addNote(Note note) = _AddNOte;
  const factory NotesEvent.deleteNote(int noteId) = _DeleteNote;
  const factory NotesEvent.updateNote(Note note) = _UpdateNote;
}