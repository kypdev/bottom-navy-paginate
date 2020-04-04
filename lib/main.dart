import 'package:bottom_nav_bar/reccom_screen.dart';
import 'package:bottom_nav_bar/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'history_screen.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        body: SizedBox.expand(
          child: PageView(

            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              HomeScreen(),
              HistoryScreen(),
              ReccommendScreen(),
              SettingScreen(),
              Container(
                alignment: Alignment.center,
                color: Colors.greenAccent,
                child: Text('Family'),)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          showElevation: true,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.home),
              activeColor: Colors.blue,
              inactiveColor: Colors.grey[600],
            ),
            BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.apps),
              activeColor: Colors.red,
              inactiveColor: Colors.grey[600],
            ),
            BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.chat_bubble),
              activeColor: Colors.deepPurple,
              inactiveColor: Colors.grey[600],
            ),
            BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.settings),
              inactiveColor: Colors.grey[600],
            ),
            BottomNavyBarItem(
              title: Text('Item One'),
              icon: Icon(Icons.settings),
              activeColor: Colors.greenAccent,
              inactiveColor: Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}