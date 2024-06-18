import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:possapp/data/models/response/note_respon_model.dart';
import 'package:possapp/presentation/note/bloc/notes/notes_bloc.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note note;

  NoteDetailScreen({required this.note});

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final updatedNote = Note(
      id: widget.note.id,
      userId: widget.note.userId,
      title: _titleController.text,
      content: _contentController.text,
      createdAt: widget.note.createdAt,
      updatedAt: DateTime.now(),
    );
    context.read<NotesBloc>().add(NotesEvent.updateNote(updatedNote));
    Navigator.pop(context, updatedNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFC700),
        title: const Text(
          'Note Detail',
          style: TextStyle(color: Color.fromRGBO(11, 30, 88, 1)),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.save,
              color: Color.fromRGBO(11, 30, 88, 1),
            ),
            onPressed: _saveNote
            ,
          ),
        ],
      ),
      body: Stack(
        children: [
          // First background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg_detail.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Second background image
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 200.0),
              child: Container(
                height: 370.0,
                width: 370.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/human-2.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  DateFormat('h:mm dd MMM')
                      .format(widget.note.updatedAt ?? DateTime.now()),
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: TextFormField(
                    controller: _contentController,
                    maxLines: null,
                    expands: true,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Content',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
