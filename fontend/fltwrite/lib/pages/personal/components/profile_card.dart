import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final Function onTap;
  ProfileCard({Key key, this.onTap}) : super(key: key);
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      ),
      onPressed: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(50.w, 50.h, 50.w, 50.h),
        margin: EdgeInsets.only(bottom: 50.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20.0.r)]),
        width: double.infinity,
        height: 300.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 60.w),
                  child: CircleAvatar(
                      radius: 80.w,
                      backgroundImage: AssetImage('assets/image/dinasaur.jpg')),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "小可爱",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.h,
                          color: Colors.black),
                    ),
                    Text(
                      "暨南大学",
                      style: TextStyle(color: Colors.black87),
                    )
                  ],
                )
              ],
            )),
            Icon(
              Icons.keyboard_arrow_right,
              size: 60.w,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
