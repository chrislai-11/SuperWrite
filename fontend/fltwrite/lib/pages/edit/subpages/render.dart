import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/edit/components/choose_type_button.dart';
import 'package:fltwrite/pages/edit/components/image_container.dart';
import 'package:fltwrite/pages/edit/components/more_pop_menu.dart';
import 'package:fltwrite/pages/edit/components/read_content.dart';
import 'package:fltwrite/pages/edit/components/subtitle.dart';
import 'package:fltwrite/store/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class RenderPage extends WPage {
  @override
  _RenderPageState createState() => _RenderPageState();
}

class _RenderPageState extends WPageState {
  final bool hasAppBar = false;
  final bool hasBottomBar = false;
  final String barTitle = "编辑";
  FileStore fileStore = FileStore();
  List para;
  Map<String, dynamic> postData = Map();

  @override
  void initState() {
    super.initState();
    fileStore = this.$store('file');
    para = fileStore.show['para'];

    fileStore.clearEditWidgets();
    para.forEach((element) {
      element.forEach((key, value) {
        fileStore.addEditWidget(EditWidget(EditType.title, key));
        fileStore.editWidgets.add(EditWidget(EditType.content, value));
      });
    });
  }

  Future<String> postGenerate() async {
    String url = "http://127.0.0.1:5000/generateDocx/";

    ///创建Dio
    Dio dio = new Dio();
    FormData formdata = FormData.fromMap(postData);

    ///发起post请求
    Response response = await dio.post(url, data: formdata);
    return response.data['path'];
  }

  Future<void> download() async {
    List postList = [];
    int imgIndex = 0;
    fileStore.editWidgets.forEach((element) async {
      var temp;
      if (element.type == EditType.title) {
        temp = {'type': 'title', 'value': element.content};
      } else if (element.type == EditType.content) {
        temp = {'type': 'content', 'value': element.content};
      } else if (element.type == EditType.image) {
        temp = {'type': 'image', 'value': imgIndex.toString()};
        // print(element.content.path);
        var img = await MultipartFile.fromFile(element.content.path);
        // print(img);
        postData['image' + imgIndex.toString()] = img;
        imgIndex++;
      }
      postList.add(json.encode(temp));
    });
    postData['text'] = json.encode(postList);
  }

  // Future<void> downloadSaveFile(path) async {
  //   Dio dio = Dio();
  //   PermissionStatus status = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.storage);
  //   //判断如果还没拥有读写权限就申请获取权限
  //   if (status != PermissionStatus.granted) {
  //     var map = await PermissionHandler()
  //         .requestPermissions([PermissionGroup.storage]).then((value) {
  //       print(value);
  //     });
  //     if (map[PermissionGroup.storage] == PermissionStatus.granted) {
  //       status = PermissionStatus.granted;
  //     }
  //   }
  //   if (true) {
  //     String dirloc = "";
  //     if (Platform.isAndroid) {
  //       dirloc = "/sdcard/download/";
  //     } else {
  //       dirloc = (await getTemporaryDirectory()).path;
  //       dirloc = dirloc.replaceFirst("Library/Caches", "Documents/");
  //     }
  //     try {
  //       FileUtils.mkdir([dirloc]);
  //       await dio.download("http://127.0.0.1:5000" + path, dirloc + 'test.docx',
  //           onReceiveProgress: (receivedBytes, totalBytes) {
  //         setState(() {});
  //       });
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(barTitle),
      actions: [
        PopupMenuButton<PopMenuType>(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) => <PopupMenuItem<PopMenuType>>[
            selectView(Icons.download_done_rounded, '下载', PopMenuType.download),
            selectView(Icons.reorder_rounded, '识别项', PopMenuType.identify),
          ],
          onSelected: (PopMenuType action) async {
            // 点击选项的时候
            switch (action) {
              case PopMenuType.download:
                await download();
                String path = await postGenerate();
                print(path);
                break;
              case PopMenuType.identify:
                break;
            }
          },
        )
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 50.h),
          child: $observer((_) {
            return ListView.separated(
              itemCount: fileStore.editWidgets.length,
              itemBuilder: (BuildContext context, int index) {
                EditWidget temp = fileStore.editWidgets[index];
                if (temp.type == EditType.title) {
                  return SubTitle(
                    title: temp.content,
                    onChange: (v) {
                      fileStore.changeContent(index, v);
                    },
                  );
                } else if (temp.type == EditType.content) {
                  return ReadContent(
                    content: temp.content,
                    onChange: (v) {
                      fileStore.changeContent(index, v);
                    },
                  );
                } else {
                  return ImageContainer(path: temp.content);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return ChooseTypeButton(
                    index: index,
                    addTitle: () {
                      // print(index);
                      fileStore.insertEditWidget(
                          index + 1, EditWidget(EditType.title, ""));
                      setState(() {});
                      Navigator.pop(context);
                    },
                    addContent: () {
                      // print(index);
                      fileStore.insertEditWidget(
                          index + 1, EditWidget(EditType.content, ""));
                      setState(() {});
                      Navigator.pop(context);
                    },
                    selectPhoto: () async {
                      File pickedFile = await ImagePicker.pickImage(
                          source: ImageSource.gallery);
                      bool imageBool = await pickedFile.exists();
                      if (imageBool) {
                        fileStore.insertEditWidget(
                            index + 1, EditWidget(EditType.image, pickedFile));
                        setState(() {});
                      }
                      Navigator.pop(context);
                    },
                    takePhoto: () async {
                      File pickedFile = await ImagePicker.pickImage(
                          source: ImageSource.camera);
                      bool imageBool = await pickedFile.exists();
                      if (imageBool) {
                        fileStore.insertEditWidget(
                            index + 1, EditWidget(EditType.image, pickedFile));
                        setState(() {});
                      }
                      Navigator.pop(context);
                    });
              },
            );
          })),
    );
  }
}
