import 'dart:async';

import 'package:hacker_news/model/story_model.dart';
import 'package:hacker_news/repository/main_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseClass {
  dispose();
}

class MainBloc extends BaseClass {
  MainRepository _mainRepository = new MainRepository();
  List<StoryModel> storyList;

  final hackerNewsController = BehaviorSubject<List<StoryModel>>();
  Stream<List<StoryModel>> get getTopNewsStream => hackerNewsController.stream;
  StreamSink<List<StoryModel>> get newsSink => hackerNewsController.sink;

  getTopHackerNews() async {
    storyList = await _mainRepository.getTopHackerNews();
    newsSink.add(storyList);
  }

  @override
  dispose() {
    hackerNewsController?.close();
  }
}
