import 'package:flutter/material.dart';
import 'package:newsil/repository/feed_http_client.dart';
import 'package:newsil/repository/providers/rotter_feed_provider.dart';
import 'package:newsil/ui/feed_page.dart';

void main() => runApp(NewsFeedApp());

class NewsFeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(
          title: "News reader",
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: Text('News reader'),
              ),
              body: FeedPage(RotterFeedProvider(FeedHttpClient()))
          )
      );
}