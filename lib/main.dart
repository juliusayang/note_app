import 'package:flutter/material.dart';
import 'package:note/pages/main_page.dart';
import 'package:note/pages/note.dart';

void main() => runApp(MaterialApp(
  //initialRoute: '/note',
  routes: {
    '/': (context) => MainPage(),
    '/note': (context) => Note(),
  }
  
));
