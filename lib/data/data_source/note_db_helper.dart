import 'package:sqflite/sqlite_api.dart';

import '../../domain/model/note.dart';

class NoteDbHelper {
  Database db;
  NoteDbHelper(this.db);
  Future<Note?> getNoteById(int id) async {
    //SELECT * FROM note WHERE id = id
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Note>> getNotes() async {
    final List<Map<String, dynamic>> maps = await db.query('note');
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  //노트 생성(insert가 제대로 되지 않았다면 0이 리턴 되므로 그 값을 이용해도 무방함)
  Future<void> insertNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  //노트 갱신
  Future<void> updateNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  //노트 삭제(insert가 제대로 되지 않았다면 0이 리턴 되므로 그 값을 이용해도 무방함)
  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
