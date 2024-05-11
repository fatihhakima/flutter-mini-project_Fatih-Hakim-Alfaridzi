import 'package:flutter/material.dart';
import 'package:mini_project_news/view/home_page.dart';
import 'package:mini_project_news/view/search_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndexNavigation;
  final Function(int) onTap;

  const CustomBottomNavBar(
      {super.key, required this.currentIndexNavigation, required this.onTap,});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  void _onItemTapped(int index) {
     switch (index) {
      case 0:
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
       break;
       case 1:
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SearchPage(),));
      break;
       case 2:
       // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
      break;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(16),
      surfaceTintColor: Colors.white,
      // color: Colors.white,
      child: SalomonBottomBar(
        duration: Duration(seconds: 1),
        items: [
          SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              selectedColor: Colors.blue),
          SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              selectedColor: Colors.blue),
          SalomonBottomBarItem(
              icon: Icon(Icons.android),
              title: Text('AI'),
              selectedColor: Colors.blue),
        ],
        currentIndex: widget.currentIndexNavigation,
        onTap: _onItemTapped,
      ),
    );
  }
}
