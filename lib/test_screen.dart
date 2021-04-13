import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScreenState();
}

const initUrl = 'https://www.work.ua/ru/news/site/1626/';
// launchApp('https://www.work.ua/ru/news/site/1626/');
// launchApp('https://www.youtube.com/watch?v=AWnQedD4BlI');

const redirectApps = [
  'instagram.com',
  'www.instagram.com',
  'youtube.com',
  'www.youtube.com',
  'youtu.be',
  'm.youtube.com',
  'facebook.com',
  'www.facebook.com',
  'm.facebook.com',
];

class _ScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview screen"),
      ),
      body: Container(
        child: InAppWebView(
          initialUrl: initUrl,
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              debuggingEnabled: true,
              useShouldOverrideUrlLoading: true,
              clearCache: true,
              mediaPlaybackRequiresUserGesture: false,
              userAgent: initUrl.contains('youtube')
                  ? 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'
                  : '',
            ),
          ),
          shouldOverrideUrlLoading: (controller, request) async {
            final uri = Uri.parse(request.url);
            if (redirectApps.contains(uri.host?.toLowerCase())) {
              return ShouldOverrideUrlLoadingAction.CANCEL;
            }
            return ShouldOverrideUrlLoadingAction.ALLOW;
          },
        ),
      ),
    );
  }
}
