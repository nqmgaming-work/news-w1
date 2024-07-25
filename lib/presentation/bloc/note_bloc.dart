import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/note.dart';
import 'note_event.dart';
import 'note_state.dart';
import '../../domain/use_cases/get_notes.dart' as use_case;
import '../../domain/use_cases/add_note.dart' as use_case;
import '../../domain/use_cases/update_note.dart' as use_case;
import '../../domain/use_cases/delete_note.dart' as use_case;

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final use_case.GetNotesUseCase getNotes;
  final use_case.AddNoteUseCase addNote;
  final use_case.UpdateNoteUseCase updateNote;
  final use_case.DeleteNoteUseCase deleteNote;

  NoteBloc({
    required this.getNotes,
    required this.addNote,
    required this.updateNote,
    required this.deleteNote,
  }) : super(NoteInitial());

  Stream<NoteState> mapEventToState(NoteEvent event) async* {
    if (event is LoadNotes) {
      yield NoteLoading();
      try {
        final notes = await getNotes();
        yield NoteLoaded(notes);
      } catch (e) {
        yield NoteError(e.toString());
      }
    } else if (event is AddNote) {
      try {
        await addNote(Note(
          id: 0,
          title: event.title,
          content: event.content,
          date: DateTime.now().toString(),
        ));
        add(LoadNotes());
      } catch (e) {
        yield NoteError(e.toString());
      }
    } else if (event is UpdateNote) {
      try {
        await updateNote(Note(
          id: event.id,
          title: event.title,
          content: event.content,
          date: DateTime.now().toString(),
        ));
        add(LoadNotes());
      } catch (e) {
        yield NoteError(e.toString());
      }
    } else if (event is DeleteNote) {
      try {
        await deleteNote(event.id);
        add(LoadNotes());
      } catch (e) {
        yield NoteError(e.toString());
      }
    }
  }
}
