import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("消息"),centerTitle: true,),
      body:GestureDetector(
        onTap: (){
          onItemClick();
        },
        child:  Container(
          height: 80,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("images/icon_news1.png",width: 50,height: 50,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12,5,0,0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("活动消息"),
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: Text("呵呵",style: TextStyle(color: Colors.grey),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Column(
                  children: <Widget>[
                    Text("12月05日",style: TextStyle(color: Colors.grey),),
                    Badge(
                      badgeContent: Text('3',style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemClick() {
    print("item click");
  }
}
