import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_news/base_configuration/base_api_provider.dart';
import 'package:hacker_news/model/comment_model.dart';

class CommentsApiProvider extends BaseApiProvider {
  static const String _TOPSTORIES = 'http://hn.algolia.com/api/v1/items/';

  //get all comments
  Future<List<CommentsModel>> getAllComments({commentsId}) async {
    try {
      Iterable storyIds = commentsId.cast<int>();
      return Future.wait(storyIds.map((id) {
        return getComments(id: id);
      }));
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  //get comment
  Future<CommentsModel> getComments({id}) async {
    try {
      Response response = await getDio().get(_TOPSTORIES + "$id");
      return CommentsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
