import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtc/pages/cours_terminer.dart';
import 'package:vtc/pages/courses_page.dart';
import 'package:vtc/pages/profil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = <Widget>[
    const CoursesPage(),
    const CoursTerminer(),
    const ProfilPage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.black,
          iconSize: 32,
          unselectedItemColor: Colors.black45,
          items: const [
            BottomNavigationBarItem(
              label: "En cour",
              icon: Icon(CupertinoIcons.car_detailed),
            ),
            BottomNavigationBarItem(
              label: "Terminé",
              icon: Icon(CupertinoIcons.check_mark),
            ),
            BottomNavigationBarItem(
              label: "Profil",
              icon: Icon(CupertinoIcons.profile_circled),
            ),
          ],
        ),
      ),
    );
  }
}
