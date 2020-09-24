import 'package:hacker_news/dbprovider/main_api.dart';
import 'package:hacker_news/model/story_model.dart';

class MainRepository {
  MainApiProvider apiProvider = new MainApiProvider();

  Future<List<StoryModel>> getTopHackerNews() async {
    return await apiProvider.getTopHackerNews();
  }
}
