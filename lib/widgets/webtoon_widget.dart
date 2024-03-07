import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';
import 'package:toonflix/widgets/imageCard_widget.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              thumb: thumb,
            ),
            //fullscreenDialog: true,
          ),
        );
      },
      child: (Column(
        children: [
          ImageContainer(
            thumb: thumb,
            id: id,
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.titleMedium?.color,
              fontSize: 18,
              fontWeight: Theme.of(context).textTheme.displayLarge?.fontWeight,
            ),
          ),
        ],
      )),
    );
  }
}
