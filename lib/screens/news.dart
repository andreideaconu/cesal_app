import 'package:cesal_app/model/promotion.dart';
import 'package:cesal_app/services/database.dart';
import 'package:cesal_app/services/rss.dart';
import 'package:cesal_app/shared/colors.dart';
import 'package:cesal_app/widgets/news_list.dart';
import 'package:cesal_app/widgets/promotion_list.dart';
import 'package:cesal_app/widgets/webview_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/webfeed.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  RssFeed feed;

  @override
  void initState() {
    super.initState();
    _initFeed();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Promotion>>.value(
        value: DatabaseService().promotionList,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              feed != null ? NewsList(feed) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(yellow)))
            ],
          ),
        )
    );
  }

  _initFeed() async {
    RssFeed newsFeed = await RssService().getFeed();
    setState(() {
      feed = newsFeed;
    });
  }
}

