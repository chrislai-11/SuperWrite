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

  @override
  Widget buildFloating(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addBaseItem');
            }),
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
                                              fontSize: 30.h,
                                            ),
                                          ),
                                          TextField(
                                            readOnly: fileStore
                                                    .baseItemList[entry.key]
                                                    .key ==
                                                '大标题',
                                            onChanged: (v) {
                                              fileStore.changeBaseKeyByIndex(
                                                  entry.key, v);
                                              setState(() {});
                                            },
                                            style: TextStyle(fontSize: 30.h),
                                            controller:
                                                TextEditingController.fromValue(
                                                    TextEditingValue(
                                                        text: entry.value.key)),
                                          ),
                                          SizedBox(
                                            height: 35.h,
                                          ),
                                          Text(
                                            "默认值",
                                            style: TextStyle(
                                              fontSize: 30.h,
                                            ),
                                          ),
                                          TextField(
                                            onChanged: (v) {
                                              fileStore.changeBaseValueByIndex(
                                                  entry.key, v);
                                              setState(() {});
                                            },
                                            style: TextStyle(fontSize: 30.h),
                                            controller:
                                                TextEditingController.fromValue(
                                                    TextEditingValue(
                                                        text:
                                                            entry.value.value)),
                                          )
                                        ],
                                      ),
                                    ));
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              entry.value.key,
                              style: TextStyle(fontSize: 35.h),
                            ),
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
          onReorder: fileStore.reorderBase,
        );
      }),
    );
  }
}
