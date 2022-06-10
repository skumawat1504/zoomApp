import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/history_screen.dart';
import 'package:zoom_app/views/screens/meeting_screen.dart';
import 'package:zoom_app/views/screens/widgets/dimensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final pages = [MeetingScreen(), HistoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text(
            "Meet & Chat",
            style: TextStyle(
                fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
          )),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          currentIndex: _pageIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.green,
          backgroundColor: footerColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: "Meet and Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: "Meeting"),
          ]),
      body: pages[_pageIndex],
    );
  }
}
