import 'package:todo_list/domain/model/note.dart';
import 'package:todo_list/domain/repository/note_repository.dart';

import '../data_source/note_db_helper.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteDbHelper db;

  NoteRepositoryImpl(this.db);

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }
}
