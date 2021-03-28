import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTitle extends StatelessWidget {
  final String title;
  final Function onChange;
  SubTitle({Key key, this.title = "", this.onChange}) : super(key: key);
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (v) {
        onChange(v);
      },
      minLines: 1,
      maxLines: 100,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.h),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(30.w),
        enabledBorder: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(
            color: Colors.grey[400],
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
      controller:
          TextEditingController.fromValue(TextEditingValue(text: title)),
    );
  }
}
