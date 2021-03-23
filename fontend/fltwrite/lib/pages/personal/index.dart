import 'package:dio/dio.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/personal/components/profile_card.dart';
import 'package:fltwrite/pages/personal/components/profile_item.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalPage extends WPage {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends WPageState {
  final String barTitle = "我的";
  final int currIndex = 2;

  ProfileStore profileStore = ProfileStore();

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 50.h),
      child: Column(
        children: [
          $observer((_) {
            return ProfileCard(
                avatuar: profileStore.avatuar,
                nickname: profileStore.nickname,
                school: profileStore.school,
                onTap: () {
                  Navigator.pushNamed(context, '/changeProfile');
                });
          }),
          //items
          ProfileItem(
            label: "报告基本信息",
            border:
                Border(top: BorderSide(color: Colors.grey[200], width: 2.h)),
            onTap: () {
              Navigator.pushNamed(context, '/baseItemChange');
            },
          ),
          ProfileItem(
            label: "内容识别项",
            border:
                Border(top: BorderSide(color: Colors.grey[200], width: 2.h)),
            onTap: () {
              Navigator.pushNamed(context, '/identifyChange');
            },
          ),
        ],
      ),
    );
  }
}
