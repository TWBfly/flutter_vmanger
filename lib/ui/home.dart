import 'package:flutter/material.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:flutter_vmanger/util/util.dart';
import 'package:flutter_vmanger/widget/marquee/marquee.dart';

import '../entity_factory.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelectToday = false;
  bool isSelectMonth = true;
  bool isSelectYear = false;
  List<String> _tipMarqueeList = [];

  @override
  Widget build(BuildContext context) {
    _tipMarqueeList.clear();
    _tipMarqueeList.addAll(["test1", "test2"]);
    var controller = MarqueeController();
    return Scaffold(
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
                                  "199",
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
                                  "199",
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
                                  "199",
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
                                          "宴会厅",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        )),
                                    Text(
                                      "100%",
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
                                          "宴会厅",
                                          style: TextStyle(color: Colors.white, fontSize: 10),
                                        )),
                                    Text(
                                      "100%",
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
                                          "宴会厅宴会厅宴会厅宴会厅宴会厅宴会厅",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )),
                                    Text(
                                      "100%",
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
                  margin: EdgeInsets.fromLTRB(0,10,0,10),
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text("新增活动",style: TextStyle(color: Colors_.color_D8781A),),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Marquee(
                            textList: _tipMarqueeList, // your text list
                            fontSize: 14.0, // text size
                            scrollDuration: Duration(seconds: 1), // every scroll duration
                            stopDuration: Duration(seconds: 3), //every stop duration
                            tapToNext: false, // tap to next
                            textColor: Colors_.color_666666, // text color
                            controller: controller, // the controller can get the position
                          ),
                        ),
                      ),
                      Text("更多",style: TextStyle(color: Colors.black54),),
                    ],
                  ),
                ),

                ///下面的item
                _homeItem(0,"酒店会议通","images/icon_sy_jdhyt.png"),
                _homeItem(1,"会场档期","images/icon_time.png"),
                _homeItem(2,"活动管理","images/icon_virtual.png"),
                _homeItem(3,"业务概况","images/icon_business.png"),

              ],
            )),
          ),
          Positioned(
            right: 0,
            bottom: 10,
            child: GestureDetector(
              onTap: (){
                tjylImg();
              },
              child: Image.asset("images/sy_tjyl.png",width: 150,height: 80,),
            ),

          ),
        ],
      ),
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
    print("今日");
    setState(() {
      isSelectToday = true;
      isSelectMonth = false;
      isSelectYear = false;
    });
  }

  ///本月
  void monthClick() {
    print("本月");
    setState(() {
      isSelectToday = false;
      isSelectMonth = true;
      isSelectYear = false;
    });
  }

  ///今年
  void yearClick() {
    print("今年");
    setState(() {
      isSelectToday = false;
      isSelectMonth = false;
      isSelectYear = true;
    });
  }

  _homeItem(int index,String text,String imgPath) {
    return  GestureDetector(
      onTap: (){
        switch(index){
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
                padding: const EdgeInsets.fromLTRB(15,0,10,0),
                child: Image.asset(imgPath,width: 30,height: 30,),
              ),
              Expanded(
                flex: 1,
                child:Text(text,style: TextStyle(fontSize: 16,color: Colors.black),),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset("images/icon_enter.png",width: 15,height: 15,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///推荐有礼
  void tjylImg() {

  }

}
