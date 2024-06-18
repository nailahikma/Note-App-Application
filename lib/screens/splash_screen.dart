import 'package:flutter/material.dart';
import 'package:possapp/presentation/note/pages/notes_screen.dart';
import 'package:possapp/screens/part/splash_widget.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffFFC700),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.5,
            child: const NoteWidget(), // SplashWidget digunakan sebagai gantinya
          ),
         
          Text(
            'Daily Notes',
            style: TextStyle
               (color: const Color.fromRGBO(18, 41, 108, 1.0),
               fontSize: 40,
          ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Text(
              'Take notes, reminders, set targets, collect resources and secure privacy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ), // Kurung kurawal pada bagian ini dihilangkan karena tidak perlu
          ),
           const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotesScreen(),
              ));
            },
            child: Text(
              'Get started',
              
            ),
          ),
         
        ],
      ),
    );
  }
}
