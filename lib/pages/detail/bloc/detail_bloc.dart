import 'dart:async';

import 'package:hacker_news/model/comment_model.dart';
import 'package:hacker_news/repository/commets_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseClass {
  dispose();
}

class DetailsBloc extends BaseClass {
  CommentsRepository _mainRepository = new CommentsRepository();

  final newsDetailsController = BehaviorSubject<List<CommentsModel>>();
  Stream<List<CommentsModel>> get getNewsDeatilsStream =>
      newsDetailsController.stream;
  StreamSink<List<CommentsModel>> get newsDetailsSink =>
      newsDetailsController.sink;

  Future<List<CommentsModel>> getAllComments({commentsId}) async {
    List<CommentsModel> commentList =
        await _mainRepository.getAllComments(commentsId: commentsId);
    print(commentList);
    newsDetailsSink.add(commentList);
  }

  @override
  dispose() {
    newsDetailsController?.close();
  }
}
