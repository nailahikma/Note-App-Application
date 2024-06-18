import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:possapp/data/models/response/note_respon_model.dart';
import 'package:possapp/presentation/note/bloc/notes/notes_bloc.dart';
import 'package:possapp/presentation/note/pages/detail_note_screen.dart';

class NoteCard extends StatelessWidget {
  final Note data;

  NoteCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DateFormat _dateFormatter = DateFormat('dd MMM, yyyy');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: BlocProvider.of<NotesBloc>(context),
              child: NoteDetailScreen(note: data),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _dateFormatter.format(data.updatedAt!),
                  style: const TextStyle(
                    color: Color(0xFFAFB4C6),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (data.id != null) {
                      context
                          .read<NotesBloc>()
                          .add(NotesEvent.deleteNote(data.id!));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Note ID is null')),
                      );
                    }
                  },
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(18, 41, 108, 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
