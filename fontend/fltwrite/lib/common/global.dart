import 'package:fltwrite/network/index.dart';
import 'package:fltwrite/store/file.dart';
import 'package:fltwrite/store/index.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';

class Global {
  static Map<String, dynamic> storeMap;
  static String startRoute = '/register';

  static Future<void> init(BuildContext context) async {
    storeMap = createStoreMap(context);

    ProfileStore profileStore = storeMap['profile'];
    if (profileStore.email == "") {
      startRoute = '/register';
    } else {
      HttpManager manager = HttpManager();
      Map<String, dynamic> postData = Map();
      postData['email'] = profileStore.email;
      HttpResponse res = await manager.postManager('/check/', postData);
      print(res.statusCode);
      if (res.statusCode == 200) {
        startRoute = '/';
      } else {
        startRoute = '/register';
      }
    }

    FileStore fileStore = storeMap['file'];
    fileStore.addBaseItem([
      FileItem("大标题", '实验报告'),
      FileItem("课程名称", ""),
      FileItem("成绩", ""),
      FileItem("实验项目名称", ""),
      FileItem("指导老师", ""),
      FileItem("实验项目编号", ""),
      FileItem("实验项目类型", ""),
      FileItem("学生姓名", ""),
      FileItem("学号", ""),
      FileItem("学院", ""),
      FileItem("专业", ""),
    ]);
    fileStore.addIdentifyItem([
      "目的",
      "仪器",
      "内容",
    ]);
  }
}
