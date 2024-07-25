import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/note_bloc.dart';
import '../../bloc/note_event.dart';

class DetailPage extends StatelessWidget {
  final int? noteId;

  DetailPage({super.key, this.noteId});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(noteId == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (noteId == null) {
                  BlocProvider.of<NoteBloc>(context).add(AddNote(
                    _titleController.text,
                    _contentController.text,
                  ));
                } else {
                  BlocProvider.of<NoteBloc>(context).add(UpdateNote(
                    noteId!,
                    _titleController.text,
                    _contentController.text,
                  ));
                }
                Navigator.pop(context);
              },
              child: Text(noteId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
