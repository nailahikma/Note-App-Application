import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:possapp/data/datasource/auth_local_datasource.dart';

import 'package:possapp/data/models/note_model.dart';
import 'package:possapp/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:possapp/presentation/auth/pages/login_page.dart';
import 'package:possapp/presentation/note/bloc/notes/notes_bloc.dart';
import 'package:possapp/presentation/note/pages/add_note_screen.dart';
import 'package:possapp/presentation/note/pages/note_card.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;

  @override
  Widget _buildCategoryImage(int index, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        height: 240.0,
        width: 270.0,
        child: Transform.scale(
          scale: _selectedCategoryIndex == index
              ? 1.1
              : 1.0, // Scale factor when selected
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<NotesBloc>().add(const NotesEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFC700),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFC700),
        actions: [
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {},
                success: (_) {
                  AuthLocalDataSource().removeAuthData();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              );
            },
            child: BlocBuilder<LogoutBloc, LogoutState>(
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Simpleé Note!',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(18, 41, 108, 1.0)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          SizedBox(
            height: 280.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePath.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const SizedBox(width: 20.0);
                }
                return _buildCategoryImage(index - 1, imagePath[index - 1]);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              'Notes',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: BlocBuilder<NotesBloc, NotesState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox();
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (message) {
                    return Center(
                      child: Text(message),
                    );
                  },
                  success: (notes) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: notes.length,
                          itemBuilder: (context, index) => NoteCard(
                                data: notes[index],
                              )),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(18, 41, 108, 1.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
