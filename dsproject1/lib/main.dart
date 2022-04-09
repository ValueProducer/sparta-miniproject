import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

final ment = ['DATA STORE', 'Name'];

final List Appbar_icon = [
  [Icons.settings, Icons.chat],
  [null, null],
  [null, null],
  [null, null],
  [null, null]
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "DATA STORE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                color: Color.fromARGB(113, 23, 21, 21),
                width: double.infinity,
                height: 150,
                child: Text("처음 오신 분들을 위한 \n 데이터 스토어 가이드",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(113, 23, 21, 21),
              width: double.infinity,
              height: 50,
              child: Text("Search",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 400,
              child: ListView(
                children: [
                  mainTitle(
                    "리워드 BEST10",
                    "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
                  ),
                  mainTitle(
                    "마감임박 공고",
                    "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
                  ),
                  mainTitle(
                    "마감임박 공고",
                    "참여 보상이 높은 상위 10개의 공고를 확인해보세요!",
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(),
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.amber,
            currentIndex: currentIndex,
            onTap: (int newIndex) {
              setState(() {
                currentIndex = newIndex;
              });
            },
            iconSize: 24,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "거래소"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "데이터 판매"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "데이터 의뢰"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "마이페이지"),
            ],
          ),
        ),
        // floatingActionButton: currentIndex == 0
        //     ? FloatingActionButton(
        //         backgroundColor: Colors.amber,
        //         onPressed: () {},
        //         child: Icon(Icons.plus_one),
        //       )
        //     : null,
      ),
    );
  }
}

Widget mainTitle(String st1, String st2) {
  return Column(
    children: [
      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 60,
        color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.alarm),
              Text(
                st1,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ]),
            Text(st2,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}

class AlbumCard extends StatelessWidget {
  const AlbumCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.artist})
      : super(key: key);

  final String imageUrl;
  final String name;
  final String artist;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: MediaQuery.of(context).size.width * 0.29,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(artist),
        ],
      ),
    );
  }
}
