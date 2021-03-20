import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  final String label;
  final Function onTap;
  final BoxBorder border;
  ProfileItem({Key key, @required this.label, this.onTap, this.border})
      : super(key: key);
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      ),
      onPressed: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 30.h, 0, 30.h),
        decoration: BoxDecoration(border: border),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "",
                  fontSize: 35.h,
                  color: Colors.black),
            ),
            Icon(Icons.keyboard_arrow_right, size: 60.w, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
