import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'camera_widget.dart';
import 'loginpage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => MainpageState();
}

class MainpageState extends State<Mainpage> {
  String name = '';
  String career = '';
  String intro = '';
  String class_tar = '';
  String class_int = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Registerclass(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: renderValues(),
          ),
        ),
      ),
    );
  }

  renderValues() {
    return Column(
      children: [
        Text('name: $name'),
        Text('career: $career'),
        Text(
          'intro: $intro',
        ),
        Text(
          'address: $class_tar',
        ),
        Text(
          'nickname: $class_int',
        ),
      ],
    );
  }
}
