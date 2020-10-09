import 'package:flutter/material.dart';
import 'package:note/pages/functions.dart';
import 'package:note/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Note extends StatefulWidget {
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final titleTextController = TextEditingController();
  final noteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  saveNote();
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleTextController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Title'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Divider(),
            TextField(
              controller: noteTextController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Notes',
              ),
            ),
          ],
        ),
      ),
    );
  }
  

  void saveNote() {
    String title = titleTextController.text;
    //String notes = noteTextController.text;
    saveNotePreference(title).then((bool commited) {
      Navigator.of(context).pushNamed('/');
    });
  }

// class SaveNote {
//   final String title;
//   final String notes;

//   SaveNote({this.title, this.notes});
// }

  
}
Future<bool> saveNotePreference(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("title", title);
    //prefs.setString("notes", notes);

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<String> getNotePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String title = prefs.getString("title");
    //String notes = prefs.getString("notes");

    return title;
  }
