import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_list/data/data_source/note_db_helper.dart';
import 'package:todo_list/domain/model/note.dart';

void main() {
  test('db test', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);

    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDbHelper(db);

    await noteDbHelper.insertNote(
      Note(
        title: 'test',
        content: 'test-content',
        color: 1,
        timestamp: 1,
      ),
    );
    expect((await noteDbHelper.getNotes()).length, 1);

    Note note = (await noteDbHelper.getNoteById(1))!;

    expect(note.id, 1);

    await noteDbHelper.updateNote(note.copyWith(title: 'update test'));
    note = (await noteDbHelper.getNoteById(1))!;

    expect(note.title, 'update test');

    await noteDbHelper.deleteNote(note);

    expect((await noteDbHelper.getNotes()).length, 0);

    await db.close();
  });
}
