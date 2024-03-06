import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String thumb;
  const ImageContainer({
    super.key,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Image.network(
        thumb,
        headers: const {
          'Referer': 'https://comic.naver.com',
        },
      ),
    );
  }
}
