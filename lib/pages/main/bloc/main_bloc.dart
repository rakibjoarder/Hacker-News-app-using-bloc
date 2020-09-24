import 'dart:async';

import 'package:hacker_news/model/story_model.dart';
import 'package:hacker_news/repository/main_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseClass {
  dispose();
}

class MainBloc extends BaseClass {
  List<Story> storyList;

  MainRepository _mainRepository = new MainRepository();

  final hackerNewsController = BehaviorSubject<List<Story>>();
  Stream<List<Story>> get getTopNewsStream => hackerNewsController.stream;
  StreamSink<List<Story>> get newsSink => hackerNewsController.sink;

  getTopHackerNewsIds() async {
    storyList = await _mainRepository.getTopHackerNews();
    newsSink.add(storyList);
  }

  @override
  dispose() {
    hackerNewsController?.close();
  }
}
