import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/classservice.dart';
import 'auth_service.dart';
import 'camera_widget.dart';
import 'loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'classservice.dart';

///좋아요 클래스
List<daily_class> favoriteClasses = [];

void toggleFavoriteImage(daily_class classservice) {
  if (favoriteClasses.contains(classservice)) {
    favoriteClasses.remove(classservice); //이미 좋아요한 경우 제거
  } else {
    favoriteClasses.add(classservice); // 새로운 클래스 추가
  }
}

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
        var floatingActionButton;
        return Scaffold(
          appBar: AppBar(
            title: Text("클래스 소개"),
            centerTitle: true,
            backgroundColor: Colors.blue,
            leading: IconButton(
                icon: Icon(
                  CupertinoIcons.compass_fill,
                  size: 28.0,
                  color: Colors.white,
                ),
                onPressed: () {}),
            actions: [
              IconButton(
                  icon: Icon(
                    CupertinoIcons.bell_solid,
                    size: 26.0,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    AuthService().signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Center(child: Text("logout")),
                ),
              )
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "https://slm-assets.secondlife.com/assets/14647728/lightbox/PICT_Sparkling_Earth_Map_Night_View_.jpg?1469398014",
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 30,
                        left: 60,
                        child: Text(
                          "Make your travel special",
                          style: GoogleFonts.lobster(
                            textStyle: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Container(
                    height: 500,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: class_list.isEmpty
                        ? Center(child: Text("클래스를 등록해주세요"))
                        : ListView.builder(
                            itemCount:
                                class_list.length, // bucketList 개수 만큼 보여주기
                            itemBuilder: (context, index) {
                              var class_num = class_list[index];
                              String name = class_num.name;
                              String career = class_num.career;
                              String intro = class_num.intro;
                              String class_tar = class_num.class_tar;
                              String class_int = class_num.class_int;
                              return GestureDetector(
                                onTap: () {
                                  //클래스 클릭시
                                },
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          color: Colors.white,
                                        ),
                                        height: 560,
                                        width: double.infinity,
                                        margin: EdgeInsets.all(20),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: double.infinity,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 2))),
                                              SizedBox(height: 10),
                                              Text("□ 호스트 소개",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                  "  - 이     름         :       " +
                                                      name,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                              SizedBox(height: 5),
                                              Text(
                                                  "  - 경력 사항      :      " +
                                                      career,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                              SizedBox(height: 5),
                                              Text("  - 자기 소개      :      ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                              Container(
                                                height: 40,
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                padding: EdgeInsets.all(4),
                                                child: Text(
                                                  intro,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text("□ 클래스 안내",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text(
                                                  "  - 추천 대상      :      " +
                                                      class_tar,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                              SizedBox(height: 5),
                                              Text("  - 클래스 소개   :     ",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                              Container(
                                                height: 60,
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 0, 0, 0),
                                                padding: EdgeInsets.all(4),
                                                child: Text(
                                                  class_int,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                            // 버킷 리스트 할 일

                                            // 삭제 아이콘 버튼
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Icon(
                                            Icons.favorite,
                                            color: favoriteClasses
                                                    .contains(classservice)
                                                ? Colors.pink
                                                : Colors.transparent,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarm'),
              BottomNavigationBarItem(
                icon: Icon(Icons.nightlight_round),
                label: 'Sleep',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting'),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Registerclass(),
                ),
              );
            },
            icon: Icon(Icons.add),
            label: Text(
              "Create your own class",
              style: TextStyle(fontSize: 15),
            ),
            backgroundColor: Colors.pink[400],
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
