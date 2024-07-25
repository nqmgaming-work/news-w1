import '../entities/note.dart';
import '../repositories/note_repository.dart';

class GetNoteDetailUseCase {
  final NoteRepository repository;

  GetNoteDetailUseCase(this.repository);

  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
