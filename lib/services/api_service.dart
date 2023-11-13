import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episodes_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = []; // 최종 결과물을 담는 리스트
    final url = Uri.parse('$baseUrl/$today'); // url 을 문자열 -> Uri 타입으로
    final response = await http.get(url); // 실제 데이터를 get. (비동기)

    // 데이터 fetching 이 정상적으로 됐는지 체크
    if (response.statusCode == 200) {
      /* 실제 데이터는 받아온 결과의 body 에 있음.
      String 이기에 JSON 으로 변환함.
      해당 JSON은  Object 가 담긴 List로 변환됨.*/
      final List<dynamic> webtoons = jsonDecode(response.body);
      // List 이기에 반복문으로 돌릴 수 있음.
      for (var webtoon in webtoons) {
        // 최종 결과물을 담는 List 에 JSON을 클래스로 변환하여 넣음.
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodesModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodesModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodesModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
