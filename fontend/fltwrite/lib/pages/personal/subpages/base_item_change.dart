import 'package:fltwrite/common/wpage.dart';
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
  final bool floating = true;
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
      if (newIndex == fileStore.baseItemList.length) {
        newIndex = fileStore.baseItemList.length - 1;
      }
      var item = fileStore.baseItemList.removeAt(oldIndex);
      fileStore.baseItemList.insert(newIndex, item);
    });
  }

  @override
  Widget buildFloating(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          print("FloatingActionButton");
        },
        child: IconButton(icon: Icon(Icons.add), onPressed: () {}),
        tooltip: "按这么长时间干嘛",
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        // elevation: 6.0,
        // highlightElevation: 12.0,
        shape: CircleBorder());
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 50.h),
      child: $observer((_) {
        return ReorderableListView(
          children: fileStore.baseItemList.asMap().entries.map((entry) {
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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 30.w),
                          child: Text(
                            entry.value.key,
                            style: TextStyle(fontSize: 35.h),
                          ),
                        ),
                        Text(
                          entry.value.value,
                          style: TextStyle(fontSize: 35.h),
                        )
                      ],
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
                                        fileStore.baseItemList
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
                ));
          }).toList(),
          onReorder: _onReorder,
        );
      }),
    );
  }
}
