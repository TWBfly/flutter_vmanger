import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vmanger/test/main.dart';
import 'package:flutter_vmanger/ui/activity_list.dart';
import 'package:flutter_vmanger/ui/message.dart';
import 'package:flutter_vmanger/ui/my.dart';
import 'package:flutter_vmanger/ui/my_share.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
//          MyRewardPage(),
          ActivityListPage(),
          MySharePage(),
          MessagePage(),
          MyPage(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _bottomItem('首页', "images/icon_home2.png","images/icon_home1.png", 0,false),
          _bottomItem('活动列表', "images/icon_list2.png","images/icon_list1.png", 1,false),
          _bottomItem('我要分享', "images/icon_share2.png","images/icon_share1.png", 2,false),
          _bottomItem('消息', "images/icon_message2.png","images/icon_message1.png", 3,true),
          _bottomItem('我的', "images/icon_me2.png","images/icon_me1.png", 4,false),
        ],

      ),
    );
  }

  _bottomItem(String title, String iconPath,String activeIconPath, int index,bool isShowBadge) {
    return BottomNavigationBarItem(
        icon: Badge(
          badgeContent: Text('3',style: TextStyle(color: Colors.white),),
          showBadge: isShowBadge,
          child: Image.asset(iconPath,width: 22,height: 22,),
        ),
        activeIcon: Badge(
            badgeContent: Text('3',style: TextStyle(color: Colors.white),),
            showBadge: isShowBadge,
            child: Image.asset(activeIconPath,width: 22,height: 22,),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex != index ? _defaultColor : _activeColor),
        ));
  }
}
