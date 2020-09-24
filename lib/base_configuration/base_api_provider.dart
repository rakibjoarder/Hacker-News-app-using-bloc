import 'package:dio/dio.dart';

class BaseApiProvider {
  static const String TAG = 'BaseApiProvider';

//  static const String _baseUrl = 'http://hn.algolia.com/api/v1/items/';
  static const String _contentType = 'Content-Type';

  Dio _dio;

  BaseApiProvider() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: 60000,
      receiveTimeout: 60000,
      headers: {
        "Accept": "application/json",
        _contentType: 'application/json',
      },
    );

    _dio = Dio(dioOptions);
  }

  Dio getDio() => _dio;

  String handleError(DioError error) {
    String errorDescription = "";

    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
            "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
            "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Send timeout in connection with API server";
        break;
    }

    return errorDescription;
  }
}
