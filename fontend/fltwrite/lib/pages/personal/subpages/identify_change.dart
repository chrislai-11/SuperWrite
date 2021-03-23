import 'package:dio/dio.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/personal/components/profile_item.dart';
import 'package:fltwrite/store/file.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdentifyChange extends WPage {
  @override
  _IdentifyChangeState createState() => _IdentifyChangeState();
}

class _IdentifyChangeState extends WPageState {
  final String barTitle = "内容识别项";
  final bool hasBottomBar = false;
  ProfileStore profileStore = ProfileStore();
  FileStore fileStore = FileStore();

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
    fileStore = this.$store('file');
  }

  _onReorder(int oldIndex, int newIndex) {
    print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == fileStore.identifyItemList.length) {
        newIndex = fileStore.identifyItemList.length - 1;
      }
      var item = fileStore.identifyItemList.removeAt(oldIndex);
      fileStore.identifyItemList.insert(newIndex, item);
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 50.h),
      child: $observer((_) {
        return ReorderableListView(
          children: fileStore.identifyItemList.asMap().entries.map((entry) {
            return Container(
              key: ObjectKey(entry.key),
              margin: EdgeInsets.all(15.h),
              padding: EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[200],
                ),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 30.w),
                    child: Text(
                      entry.value,
                      style: TextStyle(fontSize: 35.h),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      print(entry.key);
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("确定删除吗?"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context, "cancel");
                                    },
                                    child: Text("取消")),
                                ElevatedButton(
                                    onPressed: () {
                                      fileStore.identifyItemList
                                          .removeAt(entry.key);
                                      Navigator.pop(context, "yes");
                                    },
                                    child: Text("确定")),
                              ],
                            );
                          });
                    },
                    child: Icon(Icons.delete_outline),
                  ),
                ],
              ),
            );
          }).toList(),
          onReorder: _onReorder,
        );
      }),
    );
  }
}
