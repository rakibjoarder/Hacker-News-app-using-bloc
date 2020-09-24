import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_news/base_configuration/base_api_provider.dart';
import 'package:hacker_news/model/story_model.dart';

class MainApiProvider extends BaseApiProvider {
  static const String _TOPSTORIES =
      'https://hacker-news.firebaseio.com/v0/topstories.json';
  static const String _SINGLE_HN_ITEM =
      'https://hacker-news.firebaseio.com/v0/item/';

  getTopHackerNews() async {
    try {
      Response response = await getDio().get(_TOPSTORIES);
      if (response.statusCode == 200) {
        Iterable storyIds = response.data.cast<int>();
        print(storyIds);
        return Future.wait(storyIds.take(25).map((storyId) {
          return getTopNews(id: storyId);
        }));
      }
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<Story> getTopNews({id}) async {
    try {
      final response =
          await getDio().get(_SINGLE_HN_ITEM + "${id}.json?print=pretty");
      if (response.statusCode == 200) {
        return Story.fromJson(response.data);
      }
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
