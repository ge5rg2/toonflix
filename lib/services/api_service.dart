import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toonflix/models/%08webtoon_detail.dart';
import 'package:toonflix/models/webtoom_episode.dart';
import 'package:toonflix/models/webtoon.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl$today');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(res.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Exception("Failed to load data from API ${res.statusCode}");
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodeInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeInstances;
    } else {
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }
}
