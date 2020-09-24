import 'dart:async';

import 'package:hacker_news/model/news_details_model.dart';
import 'package:hacker_news/repository/details_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseClass {
  dispose();
}

class DetailsBloc extends BaseClass {
  DetailsRepository _mainRepository = new DetailsRepository();

  final newsDetailsController = BehaviorSubject<NewsDetailsModel>();
  Stream<NewsDetailsModel> get getNewsDeatilsStream =>
      newsDetailsController.stream;
  StreamSink<NewsDetailsModel> get newsDetailsSink =>
      newsDetailsController.sink;

  NewsDetailsModel newsModel = new NewsDetailsModel();
  getTopHackerNews() async {
    newsModel = await _mainRepository.getNewsDetails();
    newsDetailsSink.add(newsModel);
  }

  @override
  dispose() {
    newsDetailsController?.close();
  }
}
