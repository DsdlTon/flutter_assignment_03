import 'package:assignment3/ui/newSubject.dart';
import 'package:assignment3/ui/task.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => TaskPage(),
        "/newSub": (context) => NewSubjectPage()
      }
    );
  }
}