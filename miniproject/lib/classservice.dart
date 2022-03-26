import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/camera_widget.dart';
import 'package:test/main.dart';
import 'package:test/mainpage.dart';

class classservice extends ChangeNotifier {
  final classCollection = FirebaseFirestore.instance.collection('class');
  List<daily_class> class_list = [
    daily_class('아무개', '플로워리스트, 꽃집 운영 2년', '열심히 하겠습니다', '꽃꽃이 배우고 싶으신 분!',
        '꽃집 운영하고 있는 아무개입니다, 꽃꽃이 경력은 2년되었구요, 취미로 꽃꽃이 배우고 싶으신 분들 신청해주세요!'),
    daily_class('김무개', '도예가, 도방 운영 2년', '열심히 하겠습니다', '도자기 배우고 싶으신 분!',
        '공예방 운영하고 있는 아무개입니다, , 취미로 도자기 배우고 싶으신 분들 신청해주세요!'), // 더미(dummy) 데이터
  ]; //ChangeNotifier : 변경된 데이터에 대해 알람을 보낸다

  List<daily_class> favoriteClasses = [];

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
