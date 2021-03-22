import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldChange extends StatelessWidget {
  final String label;
  final Function onChange;
  final Function onTap;
  final BoxBorder border;
  final int minLength;
  final TextEditingController txcontroller;
  final FocusNode focus;
  final String name;

  final ProfileStore profileStore = ProfileStore();

  TextFieldChange(
      {Key key,
      @required this.label,
      this.onChange,
      this.onTap,
      this.border,
      this.minLength = 20,
      this.focus,
      this.name,
      this.txcontroller})
      : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "",
                fontSize: 40.h,
                color: Colors.black),
          ),
          TextField(
            controller: txcontroller,
            focusNode: focus,
            autofocus: false,
            onChanged: (v) {
              onChange(v);
            },
            style: TextStyle(fontSize: 35.h, fontWeight: FontWeight.bold),
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(minLength), //限制长度
            ],
            maxLength: minLength,
            decoration: InputDecoration(counterText: ""),
          )
        ],
      ),
    );
  }
}
