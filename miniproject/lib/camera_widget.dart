import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Registerclass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return register_class();
  }
}

class register_class extends State<Registerclass> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String career = '';
  String intro = '';
  String class_tar = '';
  String class_int = '';

  PickedFile? imageFile = null;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "입력페이지",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: (imageFile == null)
                ? Text("Choose Image")
                : Image.file(File(imageFile!.path), fit: BoxFit.contain),
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 150,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      icon: Icon(Icons.add, size: 18),
                      label: Text("사진 업로드"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "● 첫번째 영역",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      renderTextFormField(
                        maxline: 1,
                        label: '1. 이름',
                        onSaved: (val) {
                          this.name = val;
                        },
                        validator: (val) {
                          if (val.length < 1) {
                            return '이름는 필수사항입니다.';
                          }

                          return null;
                        },
                      ),
                      renderTextFormField(
                        maxline: 2,
                        label: '2. 경력사항',
                        onSaved: (val) {
                          this.career = val;
                        },
                        validator: (val) {
                          if (val.length < 1) {
                            return '경력사항은 필수사항입니다.';
                          }
                          return null;
                        },
                      ),
                      renderTextFormField(
                        maxline: 2,
                        label: '3. 자기소개',
                        onSaved: (val) {
                          this.intro = val;
                        },
                        validator: (val) {
                          if (val.length < 1) {
                            return '자기 소개은 필수사항입니다.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "● 두번째 영역",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      renderTextFormField(
                        maxline: 2,
                        label: '1. 클래스 대상',
                        onSaved: (val) {
                          this.class_tar = val;
                        },
                        validator: (val) {
                          if (val.length < 1) {
                            return '클래스 대상은 필수사항입니다.';
                          }
                          return null;
                        },
                      ),
                      renderTextFormField(
                        maxline: 2,
                        label: '2. 클래스 소개',
                        onSaved: (val) {
                          this.class_int = val;
                        },
                        validator: (val) {
                          if (val.length < 1) {
                            return '경력사항은 필수사항입니다.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(class_int);
                  },
                  child: Container(
                    height: 20,
                    width: 60,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  print(class_int);
                  setState(() {
                    _formKey.currentState!.save();
                    Navigator.pop(context);
                  });
                }
              },
              child: Text('Submit'),
            ),
          ),
          renderValues()
        ]),
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

  renderTextFormField(
      {required String label,
      required FormFieldSetter onSaved,
      required FormFieldValidator validator,
      required int maxline}) {
    assert(label != null);
    assert(onSaved != null);
    assert(validator != null);

    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: maxline,
          onSaved: onSaved,
          validator: validator,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(color: Colors.amber)),
          ),
        ),
        Container(height: 16.0),
      ],
    );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
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

class BucketService extends ChangeNotifier {
  List<daily_class> class_list = [
    daily_class('이찬희', '하하하', '하하하', '하하하', '하하하'), // 더미(dummy) 데이터
  ]; //ChangeNotifier : 변경된 데이터에 대해 알람을 보낸다

  /// bucket 추가
  void createBucket(String name, String career, String intro, String class_tar,
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
