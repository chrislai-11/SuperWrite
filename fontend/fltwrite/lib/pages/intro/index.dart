import 'package:dio/dio.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/store/file.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';

class IntroPage extends WPage {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends WPageState {
  final String barTitle = "SuperWrite";

  ProfileStore profileStore = ProfileStore();
  FileStore fileStore = FileStore();

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
    fileStore = this.$store('file');
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    // String url = "http://127.0.0.1:5000/getUserInformation/";

    // ///创建Dio
    // Dio dio = new Dio();
    // Map<String, dynamic> postData = Map();
    // postData['phone'] = profileStore.telephone;

    // FormData formdata = FormData.fromMap(postData);

    // ///发起post请求
    // Response response = await dio.post(url, data: formdata);

    // var data = Map<String, dynamic>.from(response.data);

    // profileStore.setNickname(data['nickname']);
    // profileStore.setSchool(data['school']);
    // profileStore.setMajor(data['major']);
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("马上开始吧"),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/editPage');
        },
      ),
    );
  }
}
