import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Theme.of(context).textTheme.titleMedium?.color,
        title: Text("Today's Webtoon",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
              fontWeight: Theme.of(context).textTheme.displayLarge?.fontWeight,
            )),
      ),
    );
  }
}
