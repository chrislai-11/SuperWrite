import 'dart:io';

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

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(barTitle),
      actions: [MorePopMenu()],
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
                      fileStore.editWidgets.forEach((element) {
                        print(element.content);
                      });
                    },
                  );
                } else if (temp.type == EditType.content) {
                  return ReadContent(
                    content: temp.content,
                    onChange: (v) {
                      fileStore.changeContent(index, v);
                      fileStore.editWidgets.forEach((element) {
                        print(element.content);
                      });
                    },
                  );
                } else if (temp.type == EditType.image) {
                  return ImageContainer(path: temp.content);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return ChooseTypeButton(
                    index: index,
                    addTitle: () {
                      print(index);
                      fileStore.insertEditWidget(
                          index + 1, EditWidget(EditType.title, ""));
                      setState(() {});
                      Navigator.pop(context);
                    },
                    addContent: () {
                      print(index);
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
