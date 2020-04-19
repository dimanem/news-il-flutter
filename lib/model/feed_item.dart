class FeedItem {
  String title, subtitle, contentUrl, thumbnailUrl;

  FeedItem({this.title, this.subtitle, this.contentUrl,
      this.thumbnailUrl = ''});

  @override
  String toString() {
    return 'FeedItem{title: $title, subtitle: $subtitle, contentUrl: $contentUrl, thumbnailUrl: $thumbnailUrl}';
  }
}