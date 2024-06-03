import 'package:flutter/material.dart';
import 'package:teachersapp/studentEntry.dart';
import 'package:teachersapp/studentTable.dart';

class HomeScreen extends StatefulWidget {
  final String uID;
  const HomeScreen({super.key, required this.uID});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      StudentEntryPage(
        username: widget.uID,
      ),
      StudentTable(
        uiD: widget.uID,
      ),
    ];

    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Form',
            icon: Icon(Icons.add_home_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Data',
            icon: Icon(Icons.table_chart),
          ),
        ],
      ),
    );
  }
}
