import 'package:dio/dio.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/personal/components/profile_item.dart';
import 'package:fltwrite/store/file.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseItemChange extends WPage {
  @override
  _BaseItemChangeState createState() => _BaseItemChangeState();
}

class _BaseItemChangeState extends WPageState {
  final String barTitle = "报告基本信息";
  final bool hasBottomBar = false;
  ProfileStore profileStore = ProfileStore();
  FileStore fileStore = FileStore();
  List list = [];

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
    fileStore = this.$store('file');
    fileStore.addBaseItem({"key": "学校", "value": profileStore.school});
    fileStore.addBaseItem({"key": "专业", "value": profileStore.major});
    list = fileStore.baseItemList;
    print(list);
  }

  _onReorder(int oldIndex, int newIndex) {
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == list.length) {
        newIndex = list.length - 1;
      }
      var item = list.removeAt(oldIndex);
      list.insert(newIndex, item);
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 50.h),
        child: ReorderableListView(
          children: list.map((item) {
            item.forEach(key => )
            return ListTile(
              leading: Text(item["key"]),
              title: Text(item["value"]),
            );
          }).toList(),
          onReorder: _onReorder,
        ));
  }
}
