import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddIdentifyWidget extends StatelessWidget {
  final int label;
  final List valueChange;
  AddIdentifyWidget({Key key, @required this.label, this.valueChange})
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
            valueChange[label] = v;
          },
        ),
        SizedBox(
          height: 50.h,
          width: double.infinity,
        )
      ],
    );
  }
}
