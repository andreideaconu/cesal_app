import 'package:cesal_app/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: yellow,
          iconTheme: IconThemeData(color: gray),
        ),
        body: IndexedStack(
          index: _stackToView,
          children: [
            Column(
              children: [
                Expanded(
                    child: WebView(
                        key: _key,
                        javascriptMode: JavascriptMode.unrestricted,
                        initialUrl: _url,
                        onPageFinished: _handleLoad))
              ],
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(yellow))),
              ),
            ),
          ],
        ));
  }
}
