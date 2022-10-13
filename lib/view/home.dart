import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class home extends StatefulWidget {
  // Add this attribute
  @override
  _homeState createState() => _homeState();
}

var loadingPercentage = 0;

class _homeState extends State<home> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              title: Text(
                "   Baiya3 بياع   ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Stack(
              children: [
                WebView(
                  initialUrl: 'https://baiya3.com',
                  onPageStarted: (url) {
                    setState(() {
                      loadingPercentage = 0;
                    });
                  },
                  onWebViewCreated: (c) {
                    controller = c;
                  },
                  onProgress: (progress) {
                    setState(() {
                      loadingPercentage = progress;
                    });
                  },
                  onPageFinished: (url) {
                    setState(() {
                      loadingPercentage = 100;
                    });
                  },
                  navigationDelegate: (navigation) {
                    final host = Uri.parse(navigation.url).host;
                    if (host.contains('youtube.com')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Blocking navigation to $host',
                          ),
                        ),
                      );
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
                if (loadingPercentage < 100)
                  LinearProgressIndicator(
                    value: loadingPercentage / 100.0,
                    color: Colors.blue,
                    minHeight: 10,
                  ),
              ],
            ),
            endDrawer: Drawer(
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: buildmenuitem(context)),
            )));
  }

  Widget buildmenuitem(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 50,
      margin: EdgeInsets.only(top:30,right:20,left:20),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Center(
            child: Image.asset(
              "images/baiya3.jpg",
            ),
          ),
          ListTile(
            title: const Text(
              "الرئيسيه",
            ),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl('https://baiya3.com');
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: const Text(
              "ادوات رياضيه",
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D8%A3%D8%AF%D9%88%D8%A7%D8%AA%20%D8%B1%D9%8A%D8%A7%D8%B6%D9%8A%D8%A9');
            },
          ),
          ListTile(
            title: const Text("ادوات منزليه"),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D8%A3%D8%AF%D9%88%D8%A7%D8%AA%20%D9%85%D9%86%D8%B2%D9%84%D9%8A%D8%A9');
            },
            leading: Icon(Icons.account_balance),
          ),
          ListTile(
            title: const Text("الالعاب"),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D8%A7%D9%84%D8%A3%D9%84%D8%B9%D8%A7%D8%A8');
            },
            leading: Icon(Icons.gamepad),
          ),
          ListTile(
            title: const Text(
              "الصحه والجمال والعنايه",
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D8%A7%D9%84%D8%B5%D8%AD%D8%A9%20%D9%88%D8%A7%D9%84%D8%AC%D9%85%D8%A7%D9%84%20%D9%88%D8%A7%D9%84%D8%B9%D9%86%D8%A7%D9%8A%D8%A9%20%D8%A7%D9%84%D8%B4%D8%AE%D8%B5%D9%8A%D8%A9');
            },
            leading: Icon(Icons.assistant),
          ),
          ListTile(
            title: const Text("احذيه وملابس"),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl('https://baiya3.com/shows_clothes');
            },
            leading: Icon(Icons.shopping_basket),
          ),
          ListTile(
            title: const Text("العنايه بالحيوانات الاليفه"),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D8%A7%D9%84%D8%B9%D9%86%D8%A7%D9%8A%D8%A9%20%D8%A8%D8%A7%D9%84%D8%AD%D9%8A%D9%88%D8%A7%D9%86%D8%A7%D8%AA%20%D8%A7%D9%84%D8%A3%D9%84%D9%8A%D9%81%D8%A9');
            },
            leading: Icon(Icons.pets),
          ),
          ListTile(
            title: const Text("المطبخ والحمام"),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D9%85%D8%B3%D8%AA%D9%84%D8%B2%D9%85%D8%A7%D8%AA%20%D8%A7%D9%84%D9%85%D8%B7%D8%A8%D8%AE');
            },
            leading: Icon(Icons.kitchen),
          ),
          ListTile(
            leading: Icon(Icons.sentiment_satisfied),
            title: const Text(
              "منتجات الاطفال",
            ),
            onTap: () {
              Navigator.pop(context);
              controller.loadUrl(
                  'https://baiya3.com/%D9%85%D9%86%D8%AA%D8%AC%D8%A7%D8%AA%20%D8%A7%D9%84%D8%A3%D8%B7%D9%81%D8%A7%D9%84');
            },
          )
        ],
      ),
    );
  }
}
