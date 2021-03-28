import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddInputWidget extends StatelessWidget {
  final int label;
  final List labelChange;
  final List valueChange;
  AddInputWidget(
      {Key key, @required this.label, this.labelChange, this.valueChange})
      : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "添加项",
          style: TextStyle(fontSize: 35.h),
        ),
        TextField(
          onChanged: (v) {
            labelChange[label] = v;
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          "默认值",
          style: TextStyle(fontSize: 35.h),
        ),
        TextField(
          onChanged: (v) {
            valueChange[label] = v;
          },
        ),
        Divider(
          height: 80.h,
          indent: 0.0,
        )
      ],
    );
  }
}
