import 'package:newsil/repository/handlers/feed_handler.dart';
import 'package:newsil/repository/handlers/rotter_feed_handler.dart';

import '../feed_http_client.dart';
import '../feed_request.dart';
import 'feed_provider.dart';

class RotterFeedProvider extends FeedProvider {
  RotterFeedProvider(FeedHttpClient client) : super(client);

  @override
  String getImageAsset() => 'assets/images/rotter.jpg';

  @override
  FeedRequest getRequest() => FeedRequest(path: 'https://rotter.net/rss/rotternews.xml');

  @override
  IFeedHandler getHandler() => RotterFeedHandler();
}