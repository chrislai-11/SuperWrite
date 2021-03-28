import 'package:fltwrite/common/wpage.dart';
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
    // print('oldIndex: $oldIndex , newIndex: $newIndex');
    setState(() {
      if (newIndex == fileStore.identifyItemList.length) {
        newIndex = fileStore.identifyItemList.length - 1;
      }
      var item = fileStore.identifyItemList.removeAt(oldIndex);
      fileStore.identifyItemList.insert(newIndex, item);
    });
  }

  @override
  Widget buildFloating(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addIdentifyItem');
            }),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: CircleBorder());
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
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(40.w)),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              print(entry.key);
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.r))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.r)),
                                        color: Colors.white),
                                    padding: EdgeInsets.fromLTRB(
                                        40.w, 60.h, 40.w, 60.h),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "设置项",
                                          style: TextStyle(
                                            fontSize: 35.h,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (v) {
                                            fileStore.changeIdentifyByIndex(
                                                entry.key, v);
                                            setState(() {});
                                          },
                                          style: TextStyle(fontSize: 35.h),
                                          controller:
                                              TextEditingController.fromValue(
                                                  TextEditingValue(
                                                      text: entry.value)),
                                        ),
                                      ],
                                    ),
                                  ));
                            });
                      },
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              entry.value,
                              style: TextStyle(fontSize: 35.h),
                            ),
                          )
                        ],
                      ),
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
          onReorder: fileStore.reorderIdentify,
        );
      }),
    );
  }
}
