import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/note_bloc.dart';
import '../../bloc/note_state.dart';
import '../../widgets/note_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NoteLoaded) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return NoteListItem(
                  note: state.notes[index],
                  onTap: () {},
                );
              },
            );
          } else if (state is NoteError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No notes available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
