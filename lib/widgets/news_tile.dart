import 'dart:io';

import 'package:cesal_app/shared/colors.dart';
import 'package:cesal_app/widgets/webview_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:webfeed/domain/rss_item.dart';

class NewsTile extends StatelessWidget {
  final RssItem item;

  NewsTile({this.item});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return InkWell(
        enableFeedback: false,
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebViewContainer(item.link)));
        },
        child: Container(
          margin: EdgeInsets.only(
              left:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 0.0
                  : 14.0,
              top: MediaQuery.of(context).orientation == Orientation.portrait ? 14.0 : 0.0,
              right: 14.0),
          width: MediaQuery.of(context).orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.width / 2.5
                  : MediaQuery.of(context).size.width - 28,
          height:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.height / 2
                  : MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child:
              Stack(
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black])
                            .createShader(bounds);
                      },
                      blendMode: BlendMode.darken,
                      child:
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(item.content.images.first),
                                fit: BoxFit.cover,
                              ),
                            ),
                        )
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, bottom: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white70,
                              size: 11.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                            DateFormat.yMd('ro-RO').format(DateTime.parse(item.pubDate.toString())),
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11.0
                            ),
                          )],
                        ),
                      ],
                    ),
                  )],
              ),
    ));
  }
}
