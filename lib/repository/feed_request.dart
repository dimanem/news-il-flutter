enum Method {
  get,
  post
}

class FeedRequest {
  Method method;
  String path;
  Map<String, String> queryParams, data, headers;

  FeedRequest({this.method = Method.get, this.path, this.queryParams = const {
  }, this.data = const {}, this.headers = const {}});
}