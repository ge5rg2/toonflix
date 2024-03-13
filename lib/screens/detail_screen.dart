import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/models/%08webtoon_detail.dart';
import 'package:toonflix/models/webtoom_episode.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/header_widget.dart';
import 'package:toonflix/widgets/imageCard_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.thumb,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  bool expand = true;

  void handleOverView() {
    expand = !expand;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderContainer(header: widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageContainer(
                    thumb: widget.thumb,
                    id: widget.id,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expand
                              ? '${snapshot.data!.about.substring(0, 50)}...'
                              : snapshot.data!.about,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .fontSize),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${snapshot.data!.genre} / ${snapshot.data!.age}',
                              style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .fontSize),
                            ),
                            Row(
                              children: [
                                Text(
                                  expand ? '펼치기' : '접기',
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .fontSize),
                                ),
                                IconButton(
                                  onPressed: handleOverView,
                                  icon: expand
                                      ? const Icon(
                                          Icons.keyboard_arrow_down_outlined)
                                      : const Icon(
                                          Icons.keyboard_arrow_up_outlined),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        FutureBuilder(
                          // Todo- 스켈레톤 UI
                          future: episodes,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height:
                                    200, // Set a fixed height or use MediaQuery to calculate dynamically
                                child: ListWheelScrollView.useDelegate(
                                  itemExtent: 100,
                                  diameterRatio: 1.3,
                                  physics: const FixedExtentScrollPhysics(),
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: snapshot.data!.length,
                                    builder: (context, index) {
                                      final episode = snapshot.data![index];
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: const Offset(1, 3),
                                                color: Colors.black
                                                    .withOpacity(0.3)),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                width: 120,
                                                child: Image.network(
                                                  episode.thumb,
                                                  headers: const {
                                                    'Referer':
                                                        'https://comic.naver.com',
                                                  },
                                                ),
                                              ),
                                              Text(
                                                episode.title.length > 10
                                                    ? "${episode.title.substring(0, 10)}..."
                                                    : episode.title,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .cardColor,
                                                    fontSize: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .fontSize,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Icon(
                                                Icons.chevron_right_outlined,
                                                color:
                                                    Theme.of(context).cardColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
