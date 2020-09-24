import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hacker_news/base_configuration/base_api_provider.dart';
import 'package:hacker_news/model/news_details_model.dart';

class DetailsApiProvider extends BaseApiProvider {
  static const String _TOPSTORIES =
      'http://hn.algolia.com/api/v1/items/9127232';

  //summary
  Future<NewsDetailsModel> getNewsDetails() async {
    try {
      Response response = await getDio().get(_TOPSTORIES);
      return NewsDetailsModel.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
