import 'package:aayath_darse_quran/models/videos_list.dart';
import 'package:flutter/material.dart';
import'package:hive_flutter/hive_flutter.dart';

import 'package:aayath_darse_quran/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(VideoItemAdapter());
  Hive.registerAdapter(VideoAdapter());
  Hive.registerAdapter(ThumbnailsAdapter());
  Hive.registerAdapter(ResourceIdAdapter());
  Hive.registerAdapter(DefaultAdapter());
  await Hive.openBox("bookmarkBox");

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

      home: const HomeScreen(),
    );
  }
}
