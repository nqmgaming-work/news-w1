import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
import '../../models/note_model.dart';

class NoteDao {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<int> insertNote(NoteModel note) async {
    final db = await _databaseHelper.database;
    return await db.insert('notes', note.toMap());
  }

  Future<int> updateNote(NoteModel note) async {
    final db = await _databaseHelper.database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await _databaseHelper.database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<NoteModel>> getNotes() async {
    final db = await _databaseHelper.database;
    final maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return NoteModel.fromMap(maps[i]);
    });
  }

  Future<NoteModel?> getNoteById(int id) async {
    final db = await _databaseHelper.database;
    final maps = await db.query(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return NoteModel.fromMap(maps.first);
    }
    return null;
  }
}
