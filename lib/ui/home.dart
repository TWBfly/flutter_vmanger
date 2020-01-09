import 'package:flutter/material.dart';
import 'package:flutter_vmanger/model/home_model.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:flutter_vmanger/util/util.dart';
import 'package:flutter_vmanger/widget/marquee/marquee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelectToday = false;
  bool isSelectMonth = true;
  bool isSelectYear = false;
  List<String> _tipMarqueeList = [];
  //总计
  String allMeetingCount = "0";
  //已完成
  String overMeetingCount = "0";
  //待完成
  String waitMeetingCount = "0";

  String name_1 = "";
  String utilization_1 = "0%";
  String name_2 = "";
  String utilization_2 = "0%";
  String name_3 = "";
  String utilization_3 = "0%";

  @override
  void initState() {
//    monthClick();
//    _getHotInfoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("===========================HomePage build==========================");

    DateTime _lastPressedAt; //上次点击时间
    var controller = MarqueeController();
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("大酒店"),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(
              "images/icon_scan.png",
              width: 20,
              height: 20,
            ),
            onPressed: () {
              scan();
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Image.asset(
                  "images/home_search.png",
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  search();
                },
              ),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  color: Colors_.color_F5F5F5,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.blue,
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    todayClick();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 117,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: isSelectToday ? Colors.white : Colors.transparent,
                                        borderRadius: BorderRadius.horizontal(left: Radius.circular(4)),
                                        border: Border.all(width: 1, color: Colors.white)),
                                    child: Text(
                                      "今日",
                                      style: TextStyle(color: isSelectToday ? Colors_.color_2195EE : Colors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    monthClick();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 117,
                                    height: 30,
                                    decoration: BoxDecoration(color: isSelectMonth ? Colors.white : Colors.transparent, border: Border.all(width: 1, color: Colors.white)),
                                    child: Text(
                                      "本月",
                                      style: TextStyle(color: isSelectMonth ? Colors_.color_2195EE : Colors.white),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    yearClick();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 117,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: isSelectYear ? Colors.white : Colors.transparent,
                                        borderRadius: BorderRadius.horizontal(right: Radius.circular(4)),
                                        border: Border.all(width: 1, color: Colors.white)),
                                    child: Text(
                                      "今年",
                                      style: TextStyle(color: isSelectYear ? Colors_.color_2195EE : Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "活动场次",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "总计",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                      Text(
                                        allMeetingCount,
                                        style: TextStyle(color: Colors_.color_FFD093, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "已完成",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                      Text(
                                        overMeetingCount,
                                        style: TextStyle(color: Colors_.color_FFD093, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 40, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "待完成",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                      Text(
                                        waitMeetingCount,
                                        style: TextStyle(color: Colors_.color_FFD093, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "会场使用率 Top3",
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2.0),
                                        child: Image.asset(
                                          "images/one.png",
                                          width: 16,
                                          height: 21,
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              width: 70,
                                              child: Text(
                                                name_1,
                                                style: TextStyle(color: Colors.white, fontSize: 10),
                                              )),
                                          Text(
                                            utilization_1,
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2.0),
                                        child: Image.asset(
                                          "images/two.png",
                                          width: 16,
                                          height: 21,
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              width: 70,
                                              child: Text(
                                                name_2,
                                                style: TextStyle(color: Colors.white, fontSize: 10),
                                              )),
                                          Text(
                                            utilization_2,
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 30, 0),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 2.0),
                                        child: Image.asset(
                                          "images/there.png",
                                          width: 16,
                                          height: 21,
                                        ),
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Container(
                                              alignment: Alignment.center,
                                              width: 70,
                                              child: Text(
                                                name_3,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              )),
                                          Text(
                                            utilization_3,
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///跑马灯
                      Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "新增活动",
                                style: TextStyle(color: Colors_.color_D8781A),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Marquee(
                                  textList: _tipMarqueeList,
                                  // your text list
                                  fontSize: 14.0,
                                  // text size
                                  scrollDuration: Duration(seconds: 1),
                                  // every scroll duration
                                  stopDuration: Duration(seconds: 3),
                                  //every stop duration
                                  tapToNext: false,
                                  // tap to next
                                  textColor: Colors_.color_666666,
                                  // text color
                                  controller: controller, // the controller can get the position
                                ),
                              ),
                            ),
                            Text(
                              "更多",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      ///下面的item
                      _homeItem(0, "酒店会议通", "images/icon_sy_jdhyt.png"),
                      _homeItem(1, "会场档期", "images/icon_time.png"),
                      _homeItem(2, "活动管理", "images/icon_virtual.png"),
                      _homeItem(3, "业务概况", "images/icon_business.png"),
                    ],
                  )),
            ),
            Positioned(
              right: 0,
              bottom: 10,
              child: GestureDetector(
                onTap: () {
                  tjylImg();
                },
                child: Image.asset(
                  "images/sy_tjyl.png",
                  width: 150,
                  height: 80,
                ),
              ),
            ),
          ],
        ),
      ),
      onWillPop: () async{
            if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
             //两次点击间隔超过1秒则重新计时
             _lastPressedAt = DateTime.now();
             showToast(context,"再按一次退出程序");
             return false;
           }
           return true;
      },
    );
  }

  ///二维码
  void scan() {
    if (isFastClick()) {
      print("二维码");
    }
  }

  ///搜索
  void search() {
    if (isFastClick()) {
      print("搜索");
    }
  }

  ///今日
  void todayClick() {
    _getBannerData("0");
    _getRoomRate(todayStartDate(),todayEndDate());
    setState(() {
      isSelectToday = true;
      isSelectMonth = false;
      isSelectYear = false;
    });
  }

  ///本月
  void monthClick() {
    _getBannerData("1");
    _getRoomRate(monthStartDate(),monthEndDate());
    setState(() {
      isSelectToday = false;
      isSelectMonth = true;
      isSelectYear = false;
    });
  }

  ///今年
  void yearClick() {
    _getBannerData("2");
    _getRoomRate(yearStartDate(),yearEndDate());
    isSelectToday = false;
    isSelectMonth = false;
    isSelectYear = true;
//    setState(() {
//
//    });
  }

 _getBannerData(String type) async {
      getLoginInfoUserId().then((userId){
        getBannerData(type, userId).then((value) {
          if (value.code == 200) {
            allMeetingCount = value.data.allMeetingCount.toString();
            overMeetingCount = value.data.overMeetingCount.toString();
            waitMeetingCount = value.data.waitMeetingCount.toString();
//            setState(() {
//
//            });
          } else {
            print("getBannerData code:${value.code}");
          }
        }).catchError((error) {
          print("getBannerData error:$error");
        });
      });
  }


_getRoomRate(String startDate,String endDate){
  getLoginInfoSystemId().then((systemId){
    getRoomRate(startDate,endDate,systemId).then((value){
      if(value.code == 200){
          var dataList = value.data.dataList;
          if(dataList.length>=3){
            setState(() {
              name_1 = dataList[0].name;
              name_2 = dataList[1].name;
              name_3 = dataList[2].name;
              utilization_1 =dataList[0].utilization;
              utilization_2 =dataList[1].utilization;
              utilization_3 =dataList[2].utilization;
            });
          }
      }else{
        print("getRoomRate code:${value.code}");
      }
    }).catchError((error) {
      print("_getRoomRate error:$error");
    });
  });
}


  _homeItem(int index, String text, String imgPath) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            break;
          case 1:
            break;
          case 2:
            break;
          case 3:
            break;
        }
      },
      child: Container(
        height: 90,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Card(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                child: Image.asset(
                  imgPath,
                  width: 30,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "images/icon_enter.png",
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///推荐有礼
  void tjylImg() {}

  void _getHotInfoList() {
    getLoginInfoUserId().then((userId){
      getHotInfoList(userId).then((value){
        if(value.code == 200){
          var dataList = value.data.dataList;
          if(dataList!=null && dataList.isNotEmpty){
            dataList.forEach((value){
              _tipMarqueeList.add(value.content);
            });
          }
        }
      });
    });
  }
}
