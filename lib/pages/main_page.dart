import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note/pages/note.dart';

//List<updateNote> noteList = List();

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String title = "";
  String note = "";

  @override
  void initState() {
    getNotePreference().then(updateNote);
    super.initState();
  }

  // void showNotesOnList(index) {
  //   SaveNote instance = noteList[index];
  //   Navigator.pop(context, {
  //     'title': instance.title,
  //     'notes': instance.notes,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, '/note');
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          children: <Widget>[
            ListTile(
              trailing: Icon(Icons.settings),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.note),
              title: Text('Notes'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          //itemCount: noteList.length,
          itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
          child: Card(
            child: Text(title),
             //child: ListTile(
            //   onTap: () {
            //     updateNote(title);
            //   },
            // ),
          ),
        );
      }),
    );
  }

  void updateNote(String title) {
    setState(() {
      this.title = title;
    });
  }
}
