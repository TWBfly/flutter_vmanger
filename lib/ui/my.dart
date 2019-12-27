import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> imgList = ["images/wd_hdsp.png", "images/barrage_fill.png", "images/icon_v.png", "images/icon_introduce.png", "images/icon_setup.png", "images/icon_update.png", "images/icon_lock.png"];
  List<String> titleList = ["活动审批", "我的电子名片", "推荐有礼", "智能会议室介绍", "设置", "版本更新", "隐私政策"];
  File _image;
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: <Widget>[
        ///header
        Container(
          padding: EdgeInsets.fromLTRB(15, statusBarHeight, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: 130,
          color: Colors_.color_2195EE,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setHeaderImg();
                    },
                    child: _image == null
                        ? Image.asset(
                            "images/touxiang.png",
                            width: 65,
                            height: 65,
                          )
                        : ClipOval(
                            child: Image.file(
                              _image,
                              width: 65,
                              height: 65,
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "任销售总负责",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("销售总监", style: TextStyle(color: Colors.white, fontSize: 12)),
                        Image.asset(
                          "images/icon_tkhy.png",
                          width: 55,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                "images/wd_wdjf.png",
                width: 85,
                height: 30,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),

        ///
        Container(
          color: Colors.white,
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/icon_reserve.png",
                    width: 30,
                    height: 30,
                  ),
                  Text("我的活动"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: VerticalDivider(
                  color: Colors.grey,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/icon_like.png",
                    width: 30,
                    height: 30,
                  ),
                  Text("我的关注"),
                ],
              ),
            ],
          ),
        ),

        ///item
        Container(
          margin: EdgeInsets.only(top: 10),
          color: Colors.white,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  itemClick(index);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                imgList[index],
                                width: 23,
                                height: 23,
                              ),
                            ),
                            Text(titleList[index])
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Row(
                          children: <Widget>[
                            index == 2
                                ? Text(
                                    "赢积分 兑豪礼",
                                    style: TextStyle(color: Colors_.color_2195EE, fontSize: 10),
                                  )
                                : index == 5
                                    ? Text(
                                        "当前版本2.5.93",
                                        style: TextStyle(color: Colors.grey, fontSize: 12),
                                      )
                                    : Text(""),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                "images/icon_enter.png",
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index == 3
                  ? Divider(
                      color: Colors_.color_F5F5F5,
                      thickness: 10,
                    )
                  : Divider(
                      color: Colors.grey,
                      indent: 12,
                      endIndent: 12,
                    );
            },
          ),
        ),
      ],
    );
  }

  ///
  void itemClick(int index) {}

  ///设置头像
  setHeaderImg() {
    return showSheetDialog(
      context: context,
      child: CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('相册'),
            onPressed: () {
              Navigator.pop(context, 'Gallery');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('拍照'),
            onPressed: () {
              Navigator.pop(context, 'Camera');
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('取消'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ),
    );
  }

  void showSheetDialog({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        print("value:$value");
        if (value == "Camera") {
          getImageByCamera();
        } else if (value == "Gallery") {
          getImageByGallery();
        }
      }
    });
  }

  //相机
  Future<void> getImageByCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  //相册
  Future<void> getImageByGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
