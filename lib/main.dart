import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:robu_rest/screens/home_screen.dart';
import 'package:robu_rest/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoboRest',
      theme: ThemeData(
        primaryColor: Color(0xFF1A237E), // Orange from Dash Logistics
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto', colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFED1C48)),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}




