import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/store/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPage extends WPage {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends WPageState {
  final String barTitle = "编辑";
  final int currIndex = 1;
  FileStore fileStore = FileStore();

  FilePickerResult _paths;
  List<File> files;

  @override
  void initState() {
    super.initState();
    fileStore = this.$store('file');
  }

  Future<void> _openFileExplorer() async {
    try {
      _paths = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['docx']);
    } catch (ex) {
      print(ex);
    }
    setState(() {
      // _loadingPath = false;
      files = _paths.paths.map((path) => File(path)).toList();
    });
  }

  //   FilePicker.platform.clearTemporaryFiles()

  Future<void> postRequestFunction() async {
    String url = "http://127.0.0.1:5000/uploadDocx/";

    ///创建Dio
    Dio dio = new Dio();
    print(fileStore.identifyItemList);
    Map<String, dynamic> postData = Map();

    int i = 0;
    fileStore.identifyItemList.forEach((element) {
      // print(element);
      postData['title' + i.toString()] = element;
      i++;
    });
    postData['files'] = [
      await MultipartFile.fromFile(files[0].path.toString())
    ];
    print(postData);

    FormData formdata = FormData.fromMap(postData);

    ///发起post请求
    Response response = await dio.post(url, data: formdata);

    var data = response.data;
    // print(data);
    // print(data.runtimeType.toString());
    fileStore.addToShow(Map<String, dynamic>.from(data));
    Navigator.pushNamed(context, '/render');
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50.h),
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 35.h)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(60.w, 30.w, 60.w, 30.w)),
                  elevation: MaterialStateProperty.all(10.r),
                  shadowColor: MaterialStateProperty.all(Colors.grey)),
              onPressed: () async {
                await _openFileExplorer();
                print(files.toString());
                await postRequestFunction();
              },
              child: Text("打开文件"),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 35.h)),
                padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(60.w, 30.w, 60.w, 30.w)),
                elevation: MaterialStateProperty.all(10.r),
                shadowColor: MaterialStateProperty.all(Colors.grey)),
            onPressed: () async {},
            child: Text("继续编辑"),
          ),
        ],
      ),
    );
  }
}
