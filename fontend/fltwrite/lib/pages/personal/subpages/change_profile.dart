import 'package:dio/dio.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/personal/components/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeProfile extends WPage {
  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends WPageState {
  final String barTitle = "个人简介";
  final bool hasBottomBar = false;

  @override
  void initState() {
    super.initState();
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
        padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 50.h),
        child: Column(
          children: [
            ProfileItem(
              label: "昵称",
              border:
                  Border(top: BorderSide(color: Colors.grey[200], width: 2.h)),
              onTap: () {
                Navigator.pushNamed(context, '/identifyChange');
              },
            ),
          ],
        ),
      ),
    );
  }
}
