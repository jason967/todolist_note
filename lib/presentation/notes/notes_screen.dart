import 'package:flutter/material.dart';
import 'package:todo_list/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:todo_list/ui/colors.dart';

import '../../domain/model/note.dart';
import 'components/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Your note'),
        actions: const [Icon(Icons.sort)],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          NoteItem(
            note: Note(
              color: wisteria.value,
              title: '안녕하세요 (1)',
              content: '최재웅입니다.',
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
          NoteItem(
            note: Note(
              color: lightBlue.value,
              title: '안녕하세요 (2)',
              content: '박범준입니다.',
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          ),
        ],
      ),
      //end of body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
