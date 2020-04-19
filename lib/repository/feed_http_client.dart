import 'package:dio/dio.dart';

import 'feed_request.dart';

class FeedHttpResponse {
  Exception _error;
  String _response;

  FeedHttpResponse(this._response, this._error);

  String get response => _response;

  Exception get error => _error;
}

class FeedHttpClient {

  Dio _dio = Dio();

  Future<FeedHttpResponse> getFeed(FeedRequest request) async {
    try {
      Response response;
      if (request.method == Method.get) {
        if (request.headers.isNotEmpty) {
          response = await _dio.get(
              request.path, queryParameters: request.queryParams,
              options: Options(headers: request.headers)
          );
        } else {
          response = await _dio.get(
              request.path, queryParameters: request.queryParams,
          );
        }
      } else if (request.method == Method.post) {
        if (request.headers.isNotEmpty) {
          response = await _dio.post(
              request.path, queryParameters: request.queryParams,
              data: request.data, options: Options(headers: request.headers));
        } else {
          response = await _dio.post(
              request.path, queryParameters: request.queryParams,
              data: request.data);
        }
      }
//      print('Got response: ${response.data.toString()}');
      return FeedHttpResponse(response.data.toString(), null);
    } on DioError catch (e) {
      print('Got error: ${e.message}');
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      String error;
      if (e.response != null) {
        error = e.response.data;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        error = e.message;
      }
      return FeedHttpResponse(null, Exception(error));
    }
  }
}