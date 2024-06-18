import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:possapp/data/models/response/note_respon_model.dart';
import 'package:possapp/presentation/note/bloc/notes/notes_bloc.dart';

class AddNoteScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFC700),
        title: const Text('Add Note'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color(0xffFFC700), // Background color
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/human-3.png',
              width: 500, // Adjust the width as needed
              height: 730, // Adjust the height as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontSize: 17),
                    
                  ),
                  style: const TextStyle(fontSize: 17),
                  // Implementasi untuk menyimpan judul catatan
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _contentController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    labelStyle: TextStyle(fontSize: 17),
                  ),
                  maxLines: null, // Agar bisa memasukkan banyak baris
                  style: const TextStyle(fontSize: 17),
                  // Implementasi untuk menyimpan isi catatan
                ),
                const SizedBox(height: 20.0),
                // Tambahan informasi detail lainnya jika diperlukan
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: BlocConsumer<NotesBloc, NotesState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            success: (_) {
              Navigator.pop(context);
            },
          );
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              final String title = _titleController.text;
              final String content = _contentController.text;
              final Note note = Note(
                title: title,
                content: content,
                updatedAt: DateTime.now(),
              );
              context.read<NotesBloc>().add(NotesEvent.addNote(note));
            },
            backgroundColor: Colors.blue,
            child: state.maybeWhen(
              loading: () => const CircularProgressIndicator(color: Colors.white),
              orElse: () => const Icon(Icons.save),
            ),
          );
        },
      ),
    );
  }
}
