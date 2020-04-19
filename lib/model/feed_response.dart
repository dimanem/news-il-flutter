import 'package:newsil/model/feed_item.dart';

class FeedResponse {
  List<FeedItem> _feedItems;
  Exception _error;

  FeedResponse(this._feedItems, this._error);

  List<FeedItem> get feedItems => _feedItems;

  Exception get error => _error;
}