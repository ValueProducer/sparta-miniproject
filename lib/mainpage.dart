import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/classservice.dart';
import 'camera_widget.dart';
import 'loginpage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => MainpageState();
}

class MainpageState extends State<Mainpage> {
  List<daily_class> class_list = classservice().class_list;
  String name = '';
  String career = '';
  String intro = '';
  String class_tar = '';
  String class_int = '';
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (
      context,
    ) {
      return Consumer<classservice>(builder: (context, classservice, child) {
        List<daily_class> class_list = classservice.class_list;
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Container(
                  height: 500,
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: class_list.isEmpty
                      ? Center(child: Text("클래스를 등록해주세요"))
                      : ListView.builder(
                          itemCount: class_list.length, // bucketList 개수 만큼 보여주기
                          itemBuilder: (context, index) {
                            var class_num = class_list[index];
                            String name = class_num.name;
                            String career = class_num.career;
                            String intro = class_num.intro;
                            String class_tar = class_num.class_tar;
                            String class_int = class_num.class_int;
                            return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.black)),
                              height: 200,
                              width: double.infinity,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(name, style: TextStyle(fontSize: 24)),
                                  Text(career, style: TextStyle(fontSize: 24)),
                                  Text(intro, style: TextStyle(fontSize: 24)),
                                  Text(class_tar,
                                      style: TextStyle(fontSize: 24)),
                                  Text(class_int,
                                      style: TextStyle(fontSize: 24)),
                                ],
                                // 버킷 리스트 할 일

                                // 삭제 아이콘 버튼
                              ),
                            );
                          },
                        ),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registerclass(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.plus_one_outlined,
                  ),
                )
              ],
            ),
          ),
        );
      });
    });
  }
}

class daily_class {
  String name = '';
  String career = '';
  String intro = '';
  String class_tar = '';
  String class_int = '';
  daily_class(
    this.name,
    this.career,
    this.intro,
    this.class_tar,
    this.class_int,
  ); // 생성자
}
