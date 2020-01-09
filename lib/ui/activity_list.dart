import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_vmanger/entity/getmeeting_list_entity.dart';
import 'package:flutter_vmanger/event/event_bus.dart';
import 'package:flutter_vmanger/event/time_save_event.dart';
import 'package:flutter_vmanger/model/activity_list_model.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:flutter_vmanger/util/routes_name.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:flutter_vmanger/util/util.dart';

class ActivityListPage extends StatefulWidget {
  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> with TickerProviderStateMixin {
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

  int finishNum = 0;
  int allNum = 0;
  int unFinishNum = 0;

  int curPage = 1;
  int pageSize = 20;



  List<GetmeetingListDataElemants> elements;

  String startDate;
  String endDate;


  @override
  void initState() {
    _customScrollViewController = ScrollController();
    _customScrollViewController.addListener((){
      if (_customScrollViewController.position.pixels == _customScrollViewController.position.maxScrollExtent){
        print('滑动到了最底部,加载更多');
                _getMore();
      }
    });

    _getMeetingCompleteData(monthStartDate(),monthEndDate());
     startDate = monthStartDate();
     endDate = monthStartDate();
    _getMeetingList(monthStartDate(),monthEndDate(),curPage,pageSize);

    super.initState();
  }

  @override
  void dispose() {
    _customScrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("===========================ActivityListPage build==========================");
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
                            Text(allNum.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                          ],),
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("已完成"),
                            ),
                            Text(finishNum.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
                          ],),
                          Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("待完成"),
                            ),
                            Text(unFinishNum.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)
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
              delegate: SliverChildBuilderDelegate((context, index) => elements[0].meetingId==-1?emptyView():listItemView(index), //列表项创建方法
                childCount: elements==null?0:elements.length, //列表元素个数
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
              isSelectToday = false;
              isSelectWeek = true;
              isSelectMonth = false;
              isSelectYear = false;
              isSelectTime = false;
              curPage = 1;
              _getMeetingList("2020-01-01","2020-01-01",curPage,pageSize);
            break;
          case "本月":
              isSelectToday = false;
              isSelectWeek = false;
              isSelectMonth = true;
              isSelectYear = false;
              isSelectTime = false;
              curPage = 1;
              _getMeetingList(monthStartDate(),monthEndDate(),curPage,pageSize);
            break;
          case "本年":
              isSelectToday = false;
              isSelectWeek = false;
              isSelectMonth = false;
              isSelectYear = true;
              isSelectTime = false;
              curPage = 1;
              _getMeetingList(yearStartDate(),yearEndDate(),curPage,pageSize);
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
    isSelectToday = true;
    isSelectWeek = false;
    isSelectMonth = false;
    isSelectYear = false;
    isSelectTime = false;
    curPage = 1;
    startDate = todayStartDate();
    endDate = todayEndDate();
    _getMeetingList(todayStartDate(),todayEndDate(),curPage,pageSize);
  }

  ///选择时间
  void tabSelectedTime() {
    print("选择时间");

    isSelectToday = false;
    isSelectWeek = false;
    isSelectMonth = false;
    isSelectYear = false;
    isSelectTime = true;
    Navigator.pushNamed(context, select_time_page).then((value){
      if(value!=null){
        var map = value as Map;
        var startTime = map["startTime"];
        var endTime = map["endTime"];
        selectText = "起$startTime\n止$endTime";
        curPage = 1;
        startDate = startTime+startEnd;
        endDate = endTime+endEnd;
        _getMeetingList(startTime+startEnd,endTime+endEnd,curPage,pageSize);
        print("startTime:$startTime");
        print("endTime:$endTime");
      }

      //Unhandled Exception: setState() called after dispose()
      //This error happens if you call setState() on a State object for a widget that no longer appears in the widget tree (e.g., whose parent widget no longer includes the widget in its build). This error can occur when code calls setState() from a timer or an animation callback.
      //The preferred solution is to cancel the timer or stop listening to the animation in the dispose() callback. Another solution is to check the "mounted" property of this object before calling setState() to ensure the object is still in the tree.

      // mounted 为 true 表示当前页面挂在到构件树中，为 false 时未挂载当前页面
//      if(mounted){
//        _getMeetingList(startTime,endTime,curPage,pageSize);
//      }
    });
  }

  ///item
  listItemView(int index) {
    var element = elements[index];
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
                      Opacity(
                        opacity: element.isVzh == 0 ?0.0:1.0,
                        child: Image.asset("images/icon_robot.png",width: 25,height: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(element.meetingName),
                                Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: element.meetingStatus =="进行中"?Image.asset("images/icon_status1.png",width: 50,height: 25,)
                                      :element.meetingStatus =="会前"?Image.asset("images/icon_status2.png",width: 50,height: 25,)
                                      :element.meetingStatus =="待办"?Image.asset("images/icon_status3.png",width: 50,height: 25,)
                                      :element.meetingStatus =="会前申请"?Image.asset("images/icon_status4.png",width: 50,height: 25,)
                                      :element.meetingStatus =="已结束"?Image.asset("images/icon_status5.png",width: 50,height: 25,)
                                      :element.meetingStatus =="已取消"?Image.asset("images/icon_status6.png",width: 50,height: 25,):Image.asset("images/icon_status6.png",width: 50,height: 25,)
                                ),
                              ],
                            ),
                            Text('${elements[index].autoDayTime}',style: TextStyle(color: Colors.grey,fontSize: 12),),
                            Container(
                                width: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:Colors_.color_F5F5F5,
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Text('${elements[index].meetingAddress}',style: TextStyle(color: Colors_.color_A1A2A1,fontSize: 12),)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ///关注
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){
                          follow(index);
                        },
                        child: element.followStatus == 0 ?Image.asset("images/icon_attention_gray.png",width: 40,height: 40,):Image.asset("images/icon_attention.png",width: 40,height: 40,),
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
  void follow(int index) {
    getLoginInfoUserId().then((userId){
      if(elements[index].followStatus == 0){
        //关注
        followUserMeeting(elements[index].meetingId,userId).then((value){
          if(value.code==200){
            setState(() {
              elements[index].followStatus = 1;
            });
          }else{
            showToast(context, value.message);
          }
        });
      }else{
      //取消关注
        cancelUserMeeting(elements[index].meetingId,userId).then((value){
          if(value.code==200){
            setState(() {
              elements[index].followStatus = 0;
            });
          }else{
            showToast(context, value.message);
          }
        });

      }

    });
  }

  ///下拉刷新
  Future<void> _onRefresh() async {
    curPage= 1;
   return _getMeetingList(startDate,endDate,curPage,pageSize);
  }

  ///总计 已完成 待完成
  void _getMeetingCompleteData(startDate, endDate) {
    getLoginInfoUserId().then((userId){
      getMeetingCompleteData(startDate,endDate,userId).then((value){
        if(value.code==200){
          finishNum = value.data.count.finishNum;
          allNum = value.data.count.allNum;
          unFinishNum = value.data.count.unFinishNum;
        }else{
          showToast(context, value.message);
        }
      });
    });
  }

  ///活动列表
  void _getMeetingList(startDate, endDate,int curPage,int pageSize) {
    getLoginInfoUserId().then((userId){
     getMeetingList(startDate, endDate, userId, curPage, pageSize).then((value){
        if(value.code == 200){
          var data = value.data.elements;
          setState(() {

          });
          if(data!=null && data.isNotEmpty){
            if(curPage == 1){
              this.elements = data;
            }else{
              elements.addAll(data);
            }

          }else{
            //空布局
            var getmeetingListDataElemants= GetmeetingListDataElemants();
            getmeetingListDataElemants.meetingId = -1;
            data.add(getmeetingListDataElemants);
            this.elements = data;
            print("空布局");
          }
        }else{
          showToast(context, value.message);
        }
     });
    });
  }

  emptyView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:530 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/empty_page_images.png",width: 100,height: 100,),
          Padding(
            padding: const EdgeInsets.only(top:5),
            child: Text("暂无数据",style: TextStyle(color: Colors.grey),),
          ),
        ],
      ),
    );
  }

  ///加载更多
  void _getMore() {
    curPage = curPage+1;
    _getMeetingList(startDate,endDate,curPage,pageSize);
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