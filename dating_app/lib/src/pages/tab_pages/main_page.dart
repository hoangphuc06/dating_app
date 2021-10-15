import 'package:delivery_app/src/pages/tab_pages/chat_tab.dart';
import 'package:delivery_app/src/pages/tab_pages/explore_tab.dart';
import 'package:delivery_app/src/pages/tab_pages/likes_tab.dart';
import 'package:delivery_app/src/pages/tab_pages/account_tab.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Widget> _widgetOptions=[
    ExploreTab(),
    LikesTab(),
    ChatTab(),
    AccountTab(),
    ];

  int _selectedItemIndex = 0;

  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedItemIndex,
      onTap: _cambiarWidget,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Explore",         
          icon: Icon(Icons.fire_extinguisher),
        ),
        BottomNavigationBarItem(
          label: "Likes",  
          icon: Icon(Icons.linked_camera_outlined),
        ),
         BottomNavigationBarItem(
           label: "Chat",  
          icon: Icon(Icons.chat_bubble),
        ),
         BottomNavigationBarItem(
           label: "Account",  
          icon: Icon(Icons.chat_sharp),
        ),
      ],
    );
  }

  
}
