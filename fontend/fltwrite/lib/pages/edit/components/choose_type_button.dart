import 'package:fltwrite/pages/edit/components/read_content.dart';
import 'package:fltwrite/pages/edit/components/subtitle.dart';
import 'package:fltwrite/store/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseTypeButton extends StatelessWidget {
  final Function addTitle;
  final Function addContent;
  final Function selectPhoto;
  final Function takePhoto;
  final int index;
  ChooseTypeButton(
      {Key key,
      @required this.index,
      @required this.addTitle,
      @required this.addContent,
      @required this.selectPhoto,
      @required this.takePhoto})
      : super(key: key);
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                padding: EdgeInsets.only(bottom: 120.h),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text("添加标题"),
                      onTap: () {
                        addTitle();
                      },
                    ),
                    ListTile(
                      title: Text("添加文本"),
                      onTap: () {
                        addContent();
                      },
                    ),
                    ListTile(
                      title: Text("从相册选择"),
                      onTap: () async {
                        selectPhoto();
                      },
                    ),
                    ListTile(
                      title: Text("拍照"),
                      onTap: () {
                        takePhoto();
                      },
                    ),
                  ],
                ),
              );
            }),
        child: Container(
          margin: EdgeInsets.only(top: 30.h, bottom: 30.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200], width: 2),
              borderRadius: BorderRadius.circular(15.r)),
          height: 100.h,
          width: double.infinity,
          child: Icon(Icons.add),
        ));
  }
}
