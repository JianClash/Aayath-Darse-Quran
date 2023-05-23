import 'package:flutter/material.dart';
import 'package:aayath_darse_quran/screens/surahs.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    HomeApp(),
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aayath Darse Quran',
      themeMode: ThemeMode.dark,
      
      theme: ThemeData(
        brightness: Brightness.light,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor:  Colors.grey[900],
        ),
      ),

      home: HomeScreen(),
    );
  }
}
