import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  final String header;
  const HeaderContainer({
    super.key,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: Colors.black,
      backgroundColor: Theme.of(context).cardColor,
      foregroundColor: Theme.of(context).textTheme.displayLarge?.color,
      title: Text(header,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
            fontWeight: Theme.of(context).textTheme.displayLarge?.fontWeight,
          )),
    );
  }
}
