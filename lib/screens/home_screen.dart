import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/header_widget.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;
  late List<dynamic> likedList;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      likedList = List<dynamic>.from(likedToons);
      // webtoon = ApiService.getToonById(likedList);
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Theme.of(context).cardColor,
          foregroundColor: Theme.of(context).textTheme.displayLarge?.color,
          title: Text("오늘의 웹툰",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                fontWeight:
                    Theme.of(context).textTheme.displayLarge?.fontWeight,
              )),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
                SizedBox(
                  height: 220,
                  child: Column(
                    children: [
                      const Text("ss"),
                      for (var likedToon in likedList)
                        Text(likedToon.toString()),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    onState() {
      initPrefs();
      setState(() {});
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
          onState: onState,
          id: webtoon.id,
          title: webtoon.title,
          thumb: webtoon.thumb,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
