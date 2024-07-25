import 'package:dartz/dartz.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../data_sources/db/note_dao.dart';
import '../models/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDao noteDao;

  NoteRepositoryImpl(this.noteDao);

  @override
  Future<List<Note>> getNotes() async {
    final notes = await noteDao.getNotes();
    return notes.map((note) => note as Note).toList();
  }

  @override
  Future<Note?> getNoteById(int id) async {
    final note = await noteDao.getNoteById(id);
    return note;
  }

  @override
  Future<void> addNote(Note note) async {
    final noteModel = NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      date: note.date,
    );
    await noteDao.insertNote(noteModel);
  }

  @override
  Future<void> updateNote(Note note) async {
    final noteModel = NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      date: note.date,
    );
    await noteDao.updateNote(noteModel);
  }

  @override
  Future<void> deleteNote(int id) async {
    await noteDao.deleteNote(id);
  }
}
