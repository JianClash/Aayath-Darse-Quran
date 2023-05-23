import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
        ]
      )
    );
  }
}


