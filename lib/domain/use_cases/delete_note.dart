import '../repositories/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.deleteNote(id);
  }
}
