import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/network/index.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateUser extends WPage {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends WPageState {
  final bool hasAppBar = false;
  final bool hasBottomBar = false;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController majorController = TextEditingController();

  ProfileStore profileStore = ProfileStore();

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
  }

  Future<void> createPost() async {
    Map<String, dynamic> postData = Map();
    postData['nickname'] = nicknameController.text;
    postData['school'] = schoolController.text;
    postData['major'] = majorController.text;
    postData['email'] = profileStore.email;

    HttpManager manager = HttpManager();
    HttpResponse res = await manager.postManager('/updateUser/', postData);
    if (res.statusCode == 200) {
      profileStore.setSchool(schoolController.text);
      profileStore.setMajor(majorController.text);
      profileStore.setNickname(nicknameController.text);
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return GestureDetector(
      // 点击空白处光标失焦
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(
            50.w, MediaQuery.of(context).padding.top + 150.h, 50.w, 120.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "创建用户",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50.h),
                    )
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  "名字",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
                ),
                TextField(
                  controller: nicknameController,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "学校",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
                ),
                TextField(
                  controller: schoolController,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "专业",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
                ),
                TextField(
                  controller: majorController,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                await createPost();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Text(
                  "创建并进入",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
