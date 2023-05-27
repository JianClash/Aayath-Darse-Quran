import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:aayath_darse_quran/screens/bookmark.dart';
import 'package:aayath_darse_quran/screens/search.dart';
import 'package:aayath_darse_quran/screens/settings.dart';
import 'package:aayath_darse_quran/screens/surahs.dart';

import 'package:aayath_darse_quran/data/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  BookmarkDataBase db = BookmarkDataBase(); 

  final List<Widget> _widgetOptions = <Widget>[
    ListSurahs(),
    const Bookmark(),
    const Search(),
    const Settings(),
  ];

  @override
  void initState(){
    super.initState();
    db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _widgetOptions[_selectedIndex],

      bottomNavigationBar:Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15,),
        child: GNav(
          gap: 8,
          tabBackgroundColor: Colors.grey[800]!,
          padding: const EdgeInsets.all(16),

          tabs: const [
            GButton(
              icon: Icons.menu_book,
              text: "Surahs",
              iconActiveColor: Colors.teal,
              textColor: Colors.teal,
            ),

            GButton(
              icon: Icons.bookmarks,
              text: "Bookmarks",
              iconActiveColor: Colors.teal,
              textColor: Colors.teal,
            ),

            GButton(
              icon: Icons.search,
              text: "Search",
              iconActiveColor: Colors.teal,
              textColor: Colors.teal,
            ),

            GButton(
              icon: Icons.settings,
              text: "Settings",
              iconActiveColor: Colors.teal,
              textColor: Colors.teal,
            ),
          ],
          selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
            });
          },
        )
      ),
    );
  }

}
