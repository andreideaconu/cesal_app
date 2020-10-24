import 'package:cesal_app/shared/colors.dart';
import 'package:cesal_app/widgets/news_tile.dart';
import 'package:cesal_app/widgets/webview_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webfeed/domain/rss_feed.dart';


class NewsList extends StatelessWidget {
  RssFeed feed;

  NewsList(this.feed);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait ? Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: feed.items.length + 1,
          itemBuilder: (context, index) {
            return index < feed.items.length ? NewsTile(item: feed.items[index]) : SizedBox(height: 14);
          }),
    ) :
    Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: ListView.builder(
            padding: EdgeInsets.only(left: 14.0),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: feed.items.length + 1,
            itemBuilder: (context, index) {
              return index < feed.items.length ? NewsTile(item: feed.items[index]) : SizedBox(width: 14);
            }),
      ),
    );

    /*
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: feed.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = feed.items[index];
            return NewsTile(item: item);/*ListTile(
              title: Text(item.title),
              subtitle: Text('Published at ' +
                  DateFormat.yMd().format(DateTime.parse(item.pubDate.toString()))),
              contentPadding: EdgeInsets.all(16.0),
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebViewContainer(
                            item.link)));
              },
            );*/
          }),
    );*/
  }
}
