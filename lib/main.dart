import 'package:flutter/material.dart';
import 'package:news_app_/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:news_app_/Services/PROVIDER.dart';
import 'package:news_app_/pages/home.dart';
import 'package:news_app_/pages/landing_page.dart';
import 'package:news_app_/pages/navigation.dart';
import 'package:news_app_/pages/setting.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(ThemeData.light()), // Set initial theme here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Echo News',
      theme: themeProvider.getTheme(), // Use the theme from ThemeProvider
      routes: {
        '/': (context) => const LandingPage(),
        '/home_page': (context) => const Home(),
        '/navigation': (context) => NavigationBarPage(),
        '/settings_page': (context) =>
            SettingsPage(), // Add the settings page route
        // ignore: prefer_const_constructors
        '/weather_page': (context) =>
            HomeScreen(), // Assuming this is the Weather screen
      },
    );
  }
}
