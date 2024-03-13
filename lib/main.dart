import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/services/api_service.dart';

void main() {
  runApp(const App());
}

// st -> shortcut to make a StatefulWidget
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(
              color: Colors.black,
            ),
            titleSmall: TextStyle(
              color: Colors.white,
              fontSize: 15,
            )),
        cardColor: Colors.green,
        canvasColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
