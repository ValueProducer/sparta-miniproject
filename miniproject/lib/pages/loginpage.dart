import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/mainpage.dart';
import 'package:test/pages/signuppage.dart';

import 'mainpage.dart';

/// 홈페이지
class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로그인")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 현재 유저 로그인 상태
            Center(
              child: Text(
                "로그인해 주세요 🙂",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 32),

            /// 이메일
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "이메일"),
            ),

            /// 비밀번호
            TextField(
              controller: passwordController,
              obscureText: false, // 비밀번호 안보이게
              decoration: InputDecoration(hintText: "비밀번호"),
            ),
            SizedBox(height: 32),

            /// 로그인 버튼
            ElevatedButton(
              child: Text("로그인", style: TextStyle(fontSize: 21)),
              onPressed: () {
                // 로그인 성공시 HomePage로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Mainpage()),
                );
              },
            ),

            /// 회원가입 버튼
            ElevatedButton(
              child: Text("회원가입", style: TextStyle(fontSize: 21)),
              onPressed: () {
                // 회원가입
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
