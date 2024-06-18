import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:possapp/data/datasource/auth_remote_datasource.dart';
import 'package:possapp/data/datasource/note_remote_datasource.dart';
import 'package:possapp/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:possapp/presentation/auth/bloc/login/login_bloc.dart';
import 'package:possapp/presentation/auth/pages/login_page.dart';
import 'package:possapp/presentation/note/bloc/notes/notes_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (content) => LoginBloc(AuthRemoteDataSource())),
      BlocProvider(create: (content) => LogoutBloc(AuthRemoteDataSource())),
      BlocProvider(
          create: (content) =>
              NotesBloc(NoteRemoteDatasource())..add(const NotesEvent.fetch())),
    ], child: const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      // home: NotesScreen(),
    ));
  }
}
