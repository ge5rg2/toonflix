import 'package:flutter/material.dart';
import 'package:toonflix/widgets/header_widget.dart';
import 'package:toonflix/widgets/imageCard_widget.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderContainer(header: title),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(thumb: thumb),
            ],
          )
        ],
      ),
    );
  }
}
