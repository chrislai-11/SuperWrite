import 'package:fltwrite/store/file.dart';
import 'package:fltwrite/store/index.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';

class Global {
  static Map<String, dynamic> storeMap;

  static void init(BuildContext context) {
    storeMap = createStoreMap(context);
    ProfileStore profileStore = storeMap['profile'];
    FileStore fileStore = storeMap['file'];

    fileStore.addBaseItem([
      FileItem("大标题", profileStore.school + '实验报告'),
      FileItem("课程名称", ""),
      FileItem("成绩", ""),
      FileItem("实验项目名称", ""),
      FileItem("指导老师", ""),
      FileItem("实验项目编号", ""),
      FileItem("实验项目类型", ""),
      FileItem("学生姓名", profileStore.nickname),
      FileItem("学号", ""),
      FileItem("学院", ""),
      FileItem("专业", profileStore.major),
    ]);

    fileStore.addIdentifyItem([
      "实验目的",
      "实验内容",
      "实验仪器",
      "实验步骤",
    ]);
  }
}
