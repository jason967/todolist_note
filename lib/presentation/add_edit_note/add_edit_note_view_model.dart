import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/domain/repository/note_repository.dart';
import 'package:todo_list/presentation/add_edit_note/add_edit_note_event.dart';

import '../../domain/model/note.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;
  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  int _color = Colors.cyan.value;
  int get color => _color;

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertNote(
        Note(
          color: color,
          title: title,
          content: content,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          id: id,
          color: color,
          title: title,
          content: content,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }
  }
}
