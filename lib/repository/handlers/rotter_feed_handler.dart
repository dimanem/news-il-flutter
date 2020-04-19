import 'package:newsil/model/feed_item.dart';
import 'package:newsil/model/feed_response.dart';

import 'feed_handler.dart';
import 'package:xml/xml.dart' as xml;

class RotterFeedHandler implements IFeedHandler {
  
  @override
  FeedResponse parseResponse(String response) {
    try {
      List<FeedItem> feedItems = [];

      final items = xml.parse(response).findAllElements('item');

      items.forEach((item) {
        var feedItem = new FeedItem(
            title: item.findElements('title').single.text,
            subtitle: item.findElements('description').single.text,
            contentUrl: item.findElements('link').single.text);
        feedItems.add(feedItem);
      });

      return FeedResponse(feedItems, null);
    } on xml.XmlParserException catch (e) {
      return FeedResponse(null, e);
    }
  }
}