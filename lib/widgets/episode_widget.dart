import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoom_episode.dart';
import 'package:url_launcher/url_launcher.dart';

class Episode extends StatelessWidget {
  final AsyncSnapshot<List<WebtoonEpisodeModel>> snapshot;
  final String webtoonId;
  const Episode({
    super.key,
    required this.snapshot,
    required this.webtoonId,
  });

  Future<bool> onButtonTap(WebtoonEpisodeModel episode) async {
    final url = Uri.parse(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
    return await launchUrl(url);
    // await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      itemExtent: 100,
      diameterRatio: 1.3,
      physics: const FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: snapshot.data!.length,
        builder: (context, index) {
          final episode = snapshot.data![index];
          return GestureDetector(
            onTap: () => onButtonTap(episode),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(1, 3),
                      color: Colors.black.withOpacity(0.3)),
                ],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Theme.of(context).cardColor,
                ),
                color: Theme.of(context).canvasColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 120,
                      child: Image.network(
                        episode.thumb,
                        headers: const {
                          'Referer': 'https://comic.naver.com',
                        },
                      ),
                    ),
                    Text(
                      episode.title.length > 10
                          ? "${episode.title.substring(0, 10)}..."
                          : episode.title,
                      style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize:
                              Theme.of(context).textTheme.titleSmall!.fontSize,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                      color: Theme.of(context).cardColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
