import 'package:equatable/equatable.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class LoadNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final String title;
  final String content;

  const AddNote(this.title, this.content);

  @override
  List<Object> get props => [title, content];
}

class UpdateNote extends NoteEvent {
  final int id;
  final String title;
  final String content;

  const UpdateNote(this.id, this.title, this.content);

  @override
  List<Object> get props => [id, title, content];
}

class DeleteNote extends NoteEvent {
  final int id;

  const DeleteNote(this.id);

  @override
  List<Object> get props => [id];
}
