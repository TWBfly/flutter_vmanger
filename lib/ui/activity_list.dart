import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vmanger/test/main.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:flutter_vmanger/util/routes_name.dart';

class ActivityListPage extends StatefulWidget {
  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> with TickerProviderStateMixin {
  //  double get screenWidth => MediaQuery.of(context).size.width;
  List<String> bannerImgList = ["images/banner1.png", "images/banner2.png"];
  double tabWidth = 70;
  double tabHeight = 40;

  bool isSelectToday = false;
  bool isSelectWeek = false;
  bool isSelectMonth = true;
  bool isSelectYear = false;
  bool isSelectTime = false;

  String selectText = "";
  ScrollController _customScrollViewController;
  @override
  void initState() {
    _customScrollViewController = ScrollController();
    _customScrollViewController.addListener((){
      if (_customScrollViewController.position.pixels == _customScrollViewController.position.maxScrollExtent){
        print('滑动到了最底部,加载更多');
        //        _getMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _customScrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("活动列表"),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                showAndHide();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Center(child: Text("隐藏已结束")),
              ),
            )
          ],
        ),
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child:  CustomScrollView(
              controller: _customScrollViewController,
          slivers: <Widget>[
            SliverAppBar(
              //SliverAppBar作为头图控件
              floating: true,
              flexibleSpace: Swiper(
                itemCount: bannerImgList.length,
                autoplay: bannerImgList.isNotEmpty,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      bannerImgClick(index);
                    },
                    child: Image.asset(
                      bannerImgList[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                pagination: SwiperPagination(),
              ),
              expandedHeight: 160,
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                minHeight: 123,
                maxHeight: 123,
                child: Column(
                  children: <Widget>[
                    ///tab
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            tabTodayClick();
                          },
                          child: Container(
                            width: tabWidth,
                            height: tabHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: isSelectToday ? Colors_.color_2195EE : Colors.transparent,
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(6)),
                                border: Border.all(width: 1, color: Colors_.color_2195EE)),
                            child: Text(
                              "今日",
                              style: TextStyle(
                                color: isSelectToday ? Colors.white : Colors_.color_2195EE,
                              ),
                            ),
                          ),
                        ),
                        _setTabWight(isSelectWeek, "本周"),
                        _setTabWight(isSelectMonth, "本月"),
                        _setTabWight(isSelectYear, "本年"),
                        GestureDetector(
                          onTap: () {
                            tabSelectedTime();
                          },
                          child: Container(
                            width: 90,
                            height: tabHeight,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: isSelectTime ? Colors_.color_2195EE : Colors.transparent,
                                borderRadius: BorderRadius.horizontal(right: Radius.circular(6)),
                                border: Border.all(width: 1, color: Colors_.color_2195EE)),
                            child:Text(
                              selectText.isEmpty?"选择时间":selectText,
                              style: TextStyle(
                                  color: isSelectTime ? Colors.white : Colors_.color_2195EE,fontSize: selectText.isEmpty?14:11
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 15,
                      color: Colors_.color_F5F5F5,
                    ),
                    ///总计 已完成 待完成
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("总计"),
                            ),
                            Text("8",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                          ],),
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("已完成"),
                            ),
                            Text("8",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                          ],),
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("待完成"),
                            ),
                            Text("8",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                          ],),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverList(
              //SliverList作为列表控件
              delegate: SliverChildBuilderDelegate(
                    (context, index) => listItemView(), //列表项创建方法
                childCount: 100, //列表元素个数
              ),
            ),
          ],

        )),
        );

  }

  ///隐藏已结束
  void showAndHide() {
    print("隐藏已结束");
  }

  //banner 点击
  void bannerImgClick(int index) {
    print("banner 点击:$index");
  }

  _setTabWight(bool isSelect, String text) {
    return GestureDetector(
      onTap: () {
        switch (text) {
          case "本周":
            setState(() {
              isSelectToday = false;
              isSelectWeek = true;
              isSelectMonth = false;
              isSelectYear = false;
              isSelectTime = false;
            });
            break;
          case "本月":
            setState(() {
              isSelectToday = false;
              isSelectWeek = false;
              isSelectMonth = true;
              isSelectYear = false;
              isSelectTime = false;
            });
            break;
          case "本年":
            setState(() {
              isSelectToday = false;
              isSelectWeek = false;
              isSelectMonth = false;
              isSelectYear = true;
              isSelectTime = false;
            });

            break;
        }
      },
      child: Container(
        width: tabWidth,
        height: tabHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: isSelect ? Colors_.color_2195EE : Colors.transparent, border: Border.all(width: 1, color: Colors_.color_2195EE)),
        child: Text(
          text,
          style: TextStyle(
            color: isSelect ? Colors.white : Colors_.color_2195EE,
          ),
        ),
      ),
    );
  }

  ///今日
  void tabTodayClick() {
    print("今日");
    setState(() {
      isSelectToday = true;
      isSelectWeek = false;
      isSelectMonth = false;
      isSelectYear = false;
      isSelectTime = false;
    });
  }

  ///选择时间
  void tabSelectedTime() {
    print("选择时间");
    setState(() {
      isSelectToday = false;
      isSelectWeek = false;
      isSelectMonth = false;
      isSelectYear = false;
      isSelectTime = true;
    });
    Navigator.pushNamed(context, select_time_page).then((value){
      var map = value as Map;
      var startTime = map["startTime"];
      var endTime = map["endTime"];

      setState(() {
        selectText = "起$startTime\n止$endTime";
      });
      print("startTime:$startTime");
      print("endTime:$endTime");
    });
  }

  ///item
  listItemView() {
    return GestureDetector(
      onTap: (){
        onItemClick();
      },
      child: InkWell(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("images/icon_robot.png",width: 25,height: 25,),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("下周的会"),
                                Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Image.asset("images/icon_status1.png",width: 50,height: 25,),
                                ),
                              ],
                            ),
                            Text("2019-12-20 13:00 至 2019-12-30 22:00",style: TextStyle(color: Colors.grey,fontSize: 12),),
                            Container(
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:Colors_.color_F5F5F5,
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Text("单会议室B",style: TextStyle(color: Colors_.color_A1A2A1,fontSize: 12),)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){
                          follow();
                        },
                        child: Image.asset("images/icon_attention_gray.png",width: 40,height: 40,),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("images/icon_enter.png",width: 18,height: 18,),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Divider(height: 1,color: Colors.grey,)
          ],
        ),
      )
    );


  }

  void onItemClick() {
    print("onItemClick");
  }

  ///关注
  void follow() {
    print("follow");
  }

  ///下拉刷新
  Future<void> _onRefresh() {
    print("_onRefresh");
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.child,
    @required this.minHeight,
    @required this.maxHeight,
  });

  final Widget child;
  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => min(minHeight, maxHeight);

  @override
  double get maxExtent => max(minHeight, maxHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 200,
      padding: EdgeInsets.fromLTRB(0,15,0,15),
      color: Colors.white,
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}