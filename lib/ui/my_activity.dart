import 'package:flutter/material.dart';
import 'package:flutter_vmanger/entity/my_activity_entity.dart';
import 'package:flutter_vmanger/model/my_activity_model.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:flutter_vmanger/util/util.dart';

class MyActivity extends StatefulWidget {
  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> with TickerProviderStateMixin {
  TabController _controller;
  List<String> tabs = ["全部", "已预定", "已确定", "已结束", "已取消"];

  List<Elements> elements;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, vsync: this)
    ..addListener((){
      //fix 点击tab执行2次,滑动不执行
      if(_controller.index.toDouble() == _controller.animation.value){
        switch(_controller.index){
          case 0:
            getMyAllMeeting("-1");
            break;
          case 1:
            getMyAllMeeting("2");
            break;
          case 2:
            getMyAllMeeting("1");
            break;
          case 3:
            getMyAllMeeting("2");
            break;
          case 4:
            getMyAllMeeting("40");
            break;
        }
      }

    });
    getMyAllMeeting("-1");

    super.initState();
  }

  void getMyAllMeeting(String flag) {
     getLoginInfoUserId().then((userId){
      myAllMeetings(flag,userId).then((value){
        if(value.code == 200){
          setState(() {

          });
          elements = value.data.elements;
          print("elements==${elements.length}");
        }else{
          showToast(context, value.message);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的活动"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          ///TabBar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors_.color_2195EE,
                  width: 1,
                ),
              ),
              tabs: tabs.map<Tab>((String tab) {
                return Tab(
                  text: tab,
                );
              }).toList(),
            ),
          ),

          ///TabBarView
          Flexible(
            child: TabBarView(
              controller: _controller,
              children: tabs.map((_){
                 return ListView.builder(
                   itemCount: elements?.length??0,
                   itemExtent: 80.0,
                   itemBuilder: (BuildContext context, int index) => listItemView(index),
                 );
               }).toList()
                ,
            ),
          ),
        ],
      ),
    );
  }

  ///item
  listItemView(int index) {
    if(elements== null || elements.isEmpty){
      //空布局
      print("=elements.isEmpty=");
    }else{
      var element = elements[index];
      return GestureDetector(
          onTap: (){
            //          onItemClick();
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

                    ],
                  ),
                ),
                Divider(height: 1,color: Colors.grey,)
              ],
            ),
          )
      );
    }
  }
}
