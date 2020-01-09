import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_vmanger/event/time_save_event.dart';
import 'package:flutter_vmanger/util/date_format/date_format_base.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:flutter_vmanger/event/event_bus.dart';
///选择时间
class SelectTimeWidget extends StatefulWidget {
  @override
  _SelectTimeWidgetState createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  var startTimeText= "";
  var endTimeText = "";
  var startTimeDate= DateTime.now();
  var endTimeDate= DateTime.now();
  var annalTimeText = DateTime.now();
  var todayTimeText = formatDate(DateTime.now() ,[yyyy,'-',mm,'-',dd]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("选择时间"),centerTitle: true,actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:8.0),
          child:GestureDetector(
            onTap: (){
              saveTime();
            },
            child: Center(child: Text("保存",style: TextStyle(color: Colors.white,fontSize: 14),)),
          ),
        )
      ],),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("活动开始时间"),
                GestureDetector(
                  onTap: (){
                    startTime();
                  },
                  child:  Text(startTimeText.isEmpty?todayTimeText:startTimeText),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("活动结束时间"),
                GestureDetector(
                  onTap: (){
                    endTime();
                  },
                  child: Text(endTimeText.isEmpty?todayTimeText:endTimeText),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  ///开始时间
  void startTime() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2010, 1, 1),
        maxTime: DateTime(2119, 12, 31), onChanged: (date) {
        }, onConfirm: (date) {
          if(date.isAfter(endTimeDate)){
            showToast(context, "开始时间不能大于结束时间");
            return;
          }
          setState(() {
            startTimeText = formatDate(date ,[yyyy,'-',mm,'-',dd]);
            startTimeDate = annalTimeText = date;
            print('confirm $startTimeText');
          });


        }, currentTime: annalTimeText, locale: LocaleType.zh);
  }

  ///结束时间
  void endTime() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2010, 1, 1),
        maxTime: DateTime(2119, 12, 31), onChanged: (date) {
        }, onConfirm: (date) {
          if(date.isBefore(startTimeDate)){
            showToast(context, "结束时间不能小于开始时间");
            return;
          }
          setState(() {
            endTimeText = formatDate(date ,[yyyy,'-',mm,'-',dd]);
            endTimeDate = annalTimeText = date;
            print('confirm $endTimeText');
          });

        }, currentTime: annalTimeText, locale: LocaleType.zh);
  }

  ///保存时间 并返回
  void saveTime() {
    Map<String, dynamic> map = Map();
    map["startTime"] = startTimeText.isEmpty?todayTimeText:startTimeText;
    map["endTime"] = endTimeText.isEmpty?todayTimeText:endTimeText;

    //发送EventBus
//    eventBus.fire(TimeSaveEvent("时间保存成功"));

    Navigator.pop(context,map);
  }
}
