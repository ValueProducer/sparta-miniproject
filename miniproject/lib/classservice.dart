import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/camera_widget.dart';
import 'package:test/main.dart';
import 'package:test/mainpage.dart';

class classservice extends ChangeNotifier {
  final classCollection = FirebaseFirestore.instance.collection('class');
  List<daily_class> class_list = [
    daily_class('이찬희11', '하하하', '하하하', '하하하', '하하하'),
    daily_class('이찬희22', '하하하', '하하하', '하하하', '하하하'), // 더미(dummy) 데이터
  ]; //ChangeNotifier : 변경된 데이터에 대해 알람을 보낸다

  /// bucket 추가
  void createclass(String name, String career, String intro, String class_tar,
      String class_int) {
    class_list.add(daily_class(name, career, intro, class_tar, class_int));
    notifyListeners(); // 갱신 = Consumer<BucketService>의 builder 부분만 새로고침
  }

  /// bucket 수정
  // void updateBucket(daily_class class_, int index) {
  //   class_list[index] = ;
  //   notifyListeners();
  // }

  /// bucket 삭제
  void deleteclass(int index) {
    class_list.removeAt(index);
    notifyListeners();
  }
}
