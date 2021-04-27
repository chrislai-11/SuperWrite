import 'dart:io';

import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/personal/components/textfield_change.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ChangeProfile extends WPage {
  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends WPageState {
  final String barTitle = "个人简介";
  final bool hasBottomBar = false;
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController majorContoller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final FocusNode nicknameFocus = FocusNode();
  final FocusNode schoolFocus = FocusNode();
  final FocusNode majorFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();

  ProfileStore profileStore = ProfileStore();

  @override
  void initState() {
    super.initState();
    profileStore = this.$store('profile');
    nicknameController.value = TextEditingValue(text: profileStore.nickname);
    schoolController.value = TextEditingValue(text: profileStore.school);
    majorContoller.value = TextEditingValue(text: profileStore.major);
    phoneController.value = TextEditingValue(text: profileStore.email);
  }

  Future<void> openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
  }

  Future<void> takePhoto() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
    print(File(pickedFile.path));
    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }

  @override
  Widget buildBody(BuildContext context) {
    return GestureDetector(
      // 点击空白处光标失焦
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(50.w, 50.h, 50.w, 50.h),
          child: $observer((_) {
            return Column(
              children: [
                TextFieldChange(
                  label: "昵称",
                  txcontroller: nicknameController,
                  focus: nicknameFocus,
                  minLength: 20,
                  onChange: (v) {
                    profileStore.setNickname(v);
                  },
                ),
                TextFieldChange(
                  label: "学校",
                  txcontroller: schoolController,
                  focus: schoolFocus,
                  minLength: 20,
                  onChange: (v) {
                    profileStore.setSchool(v);
                  },
                ),
                TextFieldChange(
                  label: "专业",
                  txcontroller: majorContoller,
                  focus: majorFocus,
                  minLength: 20,
                  onChange: (v) {
                    profileStore.setMajor(v);
                  },
                ),
                TextFieldChange(
                  label: "手机号",
                  txcontroller: phoneController,
                  focus: phoneFocus,
                  readOnly: true,
                ),
              ],
            );
          })),
    );
  }
}
