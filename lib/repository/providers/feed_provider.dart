import 'package:newsil/repository/handlers/feed_handler.dart';

import '../../model/feed_response.dart';
import '../feed_http_client.dart';
import '../feed_request.dart';

class IFeedProvider {
  Future<FeedResponse> loadFeed() async {}

  FeedRequest getRequest() {}

  String getImageAsset() {}

  IFeedHandler getHandler() {}
}

abstract class FeedProvider implements IFeedProvider {
  FeedHttpClient _client;

  FeedProvider(this._client);

  @override
  Future<FeedResponse> loadFeed() async {
    FeedHttpResponse httpResponse = await _client.getFeed(getRequest());
    if (httpResponse.error != null) {
      return FeedResponse(null, httpResponse.error);
    } else {
      return getHandler().parseResponse(httpResponse.response);
    }
  }
}