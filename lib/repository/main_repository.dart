import 'package:hacker_news/dbprovider/main_api.dart';

class MainRepository {
  MainApiProvider apiProvider = new MainApiProvider();

  getTopHackerNews() async {
    return await apiProvider.getTopHackerNews();
  }
}
