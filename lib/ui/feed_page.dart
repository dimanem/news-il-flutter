import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsil/model/feed_item.dart';
import 'package:newsil/model/feed_response.dart';
import 'package:newsil/repository/providers/feed_provider.dart';

class FeedPage extends StatefulWidget {

  final IFeedProvider _feedProvider;

  FeedPage(this._feedProvider);

  @override
  _FeedPageState createState() =>
      _FeedPageState(this._feedProvider);
}

class _FeedPageState extends State<FeedPage> {

  final IFeedProvider _feedProvider;

  _FeedPageState(this._feedProvider);

  Future<FeedResponse> loadFeed() async =>
      await _feedProvider.loadFeed();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FeedResponse>(
      builder: (context, feedResponse) {
        if (feedResponse.data == null) {
          return Container();
        }

        if (feedResponse.data.error != null) {
          return Center(
            child: Text('Failed to load feed: ${feedResponse.error.toString()}'),
          );
        }

        if (feedResponse.data.feedItems.isEmpty) {
          return Center(
            child: Text('Empty feed'),
          );
        }

        return ListView.builder(
          itemCount: feedResponse.data.feedItems.length,
          itemBuilder: (context, index) {
            FeedItem feedItem = feedResponse.data.feedItems[index];
            return ListTile(
                leading: getThumbnail(feedItem),
                title: Text(feedItem.title),
                subtitle: Text(feedItem.subtitle)
            );
          },
        );
      },
      future: loadFeed(),
    );
  }

  Image getThumbnail(FeedItem feedItem) {
    if (feedItem.thumbnailUrl.isNotEmpty) {
      return Image.network(feedItem.thumbnailUrl);
    } else {
      return Image(image: AssetImage(_feedProvider.getImageAsset()));
    }
  }
}
