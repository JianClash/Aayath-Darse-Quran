import 'package:flutter/material.dart';
import 'package:aayath_darse_quran/screens/home_screen.dart';

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
      debugShowCheckedModeBanner: false,
			themeMode: ThemeMode.system,
      theme: ThemeData(
				brightness: Brightness.light,
				appBarTheme: const AppBarTheme(
					color: Color.fromRGBO(33, 48, 69, 100),
				),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
			darkTheme: ThemeData(
				brightness: Brightness.dark,
				appBarTheme: const AppBarTheme(
					color: Color.fromRGBO(33, 48, 69, 100),
				),
				scaffoldBackgroundColor: const Color.fromRGBO(22, 22, 49, 1),
			),
      home: HomeScreen(),
    );
  }
}
