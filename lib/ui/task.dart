import 'package:assignment3/ui/complete.dart';
import 'package:assignment3/ui/todo.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TaskPageState();
  }
}

class TaskPageState extends State<TaskPage> {
  int count = 0;
  int _currentIndex = 0;
  
  final List<Widget> _childern = [
    TodoPage(), 
    CompletePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body
      //getTaskListView()
      body: _childern[_currentIndex],

      //bottomNav
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), 
              title: new Text('Task')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), 
              title: new Text('Complete')
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}