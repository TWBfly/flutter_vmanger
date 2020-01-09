import 'package:flutter/material.dart';
import 'package:flutter_vmanger/widget/webview.dart';

class MySharePage extends StatefulWidget {
  @override
  _MySharePageState createState() => _MySharePageState();
}

class _MySharePageState extends State<MySharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我要分享"),centerTitle: true,actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: GestureDetector(
              onTap: (){
                share();
              },
              child: Image.asset("images/share_message.png",width: 25,height: 25,),
            )
          )
      ],),
      body: WebViewWidget(
        url: "https://s.growingio.com/WpVm21",
      ),
    );
  }

  ///分享
  void share() {
    print("分享");
  }
}
