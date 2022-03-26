import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/loginpage%20copy.dart';

import 'auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      final user = authService.currentUser();
      return Scaffold(
        appBar: AppBar(title: Text("회원가입")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 현재 유저 로그인 상태
              Center(
                child: Text(
                  "회원가입 페이지",
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
                obscureText: true, // 비밀번호 안보이게
                decoration: InputDecoration(hintText: "비밀번호"),
              ),

              /// 비밀번호 확인
              TextField(
                controller: passwordConfirmController,
                obscureText: true, // 비밀번호 안보이게
                decoration: InputDecoration(hintText: "비밀번호확인"),
              ),
              SizedBox(height: 32),

              /// 회원가입 버튼
              ElevatedButton(
                child: Text("회원가입", style: TextStyle(fontSize: 21)),
                onPressed: () {
                  // 회원가입
                  authService.signUp(
                    email: emailController.text,
                    password: passwordConfirmController.text,
                    onSuccess: () {
                      // 회원가입 성공
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("회원가입 성공"),
                      ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    onError: (err) {
                      // 에러 발생
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(err),
                      ));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
