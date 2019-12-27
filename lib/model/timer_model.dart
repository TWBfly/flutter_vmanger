import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TimerModel extends ChangeNotifier {
  StreamSubscription _subscription;
  int _count = 0;
  int time = 60;
  ///当前计数
  int get count => time - _count;

  ///剩余时间
  _setCount() {
    _count++;
    if(_count == time){
      _count=0;
    }
    notifyListeners();
  }

  startTimer() {
    _count = 0;
    _subscription = Stream.periodic(Duration(seconds: 1)).startWith(time).take(time).listen((t) {
      _setCount();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
