import 'package:hacker_news/dbprovider/comments_api.dart';
import 'package:hacker_news/model/comment_model.dart';

class CommentsRepository {
  CommentsApiProvider apiProvider = new CommentsApiProvider();

  Future<List<CommentsModel>> getAllComments({commentsId}) async {
    return await apiProvider.getAllComments(commentsId: commentsId);
  }
}
