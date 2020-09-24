import 'package:hacker_news/dbprovider/news_details_api.dart';
import 'package:hacker_news/model/news_details_model.dart';

class DetailsRepository {
  DetailsApiProvider apiProvider = new DetailsApiProvider();

  Future<NewsDetailsModel> getNewsDetails() async {
    return await apiProvider.getNewsDetails();
  }
}
