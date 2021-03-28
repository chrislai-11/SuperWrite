import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadContent extends StatelessWidget {
  final String content;
  final Function onChange;
  ReadContent({Key key, this.content = "", this.onChange}) : super(key: key);
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (v) {
        onChange(v);
      },
      minLines: 1,
      maxLines: 100,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(30.w),
        enabledBorder: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          borderSide: BorderSide(
            color: Colors.grey[300],
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
          TextEditingController.fromValue(TextEditingValue(text: content)),
    );
  }
}
