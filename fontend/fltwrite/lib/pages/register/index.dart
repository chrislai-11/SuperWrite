import 'dart:async';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/network/index.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends WPage {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends WPageState {
  final bool hasAppBar = false;
  final bool hasBottomBar = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController verifyController = TextEditingController();

  ProfileStore profileStore = ProfileStore();

  bool tick = false;
  int currTime = 1;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
  }

  Future<void> getVerifyCode() async {
    Map<String, dynamic> postData = Map();
    postData['email'] = emailController.text;

    HttpManager manager = HttpManager();
    await manager.postManager('/getVerifyCode/', postData);
  }

  Future<void> login() async {
    ///创建Dio
    Map<String, dynamic> postData = Map();
    postData['email'] = emailController.text;
    postData['password'] = pwdController.text;
    postData['verify'] = verifyController.text;

    HttpManager manager = HttpManager();
    var res = await manager.postManager('/register/', postData);
    var data = res.data;

    if (res.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            '验证码错误',
            style: TextStyle(fontSize: 30.h),
          ),
        ),
      );
    } else {
      if (data['exit']) {
        if (data['pwdRight']) {
          profileStore.setEmail(postData['email']);
          await profileStore.getAll();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                '密码错误',
                style: TextStyle(fontSize: 30.h),
              ),
            ),
          );
        }
      } else {
        profileStore.setEmail(postData['email']);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/createUser', (route) => false);
      }
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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xffB993D6),
                Color(0xff8ca6db),
              ])),
          child: Center(
              child: Container(
            width: 650.w,
            decoration: BoxDecoration(
              color: Color.fromRGBO(250, 250, 250, 0.4),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 0.15),
                  blurRadius: 5.0.r,
                )
              ],
            ),
            padding: EdgeInsets.fromLTRB(60.w, 60.h, 60.w, 60.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "登录 / 注册",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40.h),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  '邮箱',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
                ),
                TextField(
                  controller: emailController,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  '密码',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
                ),
                TextField(
                  controller: pwdController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  '验证码',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 260.w,
                          child: TextField(
                            controller: verifyController,
                          )),
                      Container(
                        width: 240.w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(131, 135, 230, 1))),
                          onPressed: () async {
                            await getVerifyCode();
                            tick = true;
                            setState(() {});
                            _timer =
                                Timer.periodic(Duration(seconds: 1), (timer) {
                              currTime++;

                              if (currTime == 59) {
                                tick = false;
                                currTime = 1;
                                _timer.cancel();
                              }
                              setState(() {});
                            });
                          },
                          child:
                              Text(tick ? currTime.toString() + '秒' : "获取验证码"),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(131, 135, 230, 1)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(0))),
                      onPressed: () async {
                        await login();
                      },
                      child: Container(
                          width: 530.w,
                          height: 100.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "登录/注册",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35.h),
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          )),
        ));
  }
}
