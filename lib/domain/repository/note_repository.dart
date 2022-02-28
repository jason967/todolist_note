import '../model/note.dart';

abstract class NoteRepository {
  //노트 전체를 가져오는 메소드
  Future<List<Note>> getNote();
  //id를 이용해 노트를 가져오는 메소드
  Future<Note?> getNoteById(int id);
  //노트 생성
  Future<void> insertNote(Note note);
  //노트 갱신
  Future<void> updateNote(Note note);
  //노트 삭제
  Future<void> deleteNote(Note note);
}
