part of 'notes_bloc.dart';

@freezed
class NotesState with _$NotesState {
  const factory NotesState.initial() = _Initial;
  const factory NotesState.loading() = _Loading;
  const factory NotesState.success(List<Note> notes) = _Success;
  const factory NotesState.error(String message) = _Error;
}
