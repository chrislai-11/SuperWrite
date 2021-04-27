import 'package:fltwrite/pages/edit/subpages/render.dart';
import 'package:fltwrite/pages/intro/index.dart';
import 'package:fltwrite/pages/edit/index.dart';
import 'package:fltwrite/pages/personal/index.dart';
import 'package:fltwrite/pages/personal/subpages/add_base_items.dart';
import 'package:fltwrite/pages/personal/subpages/add_indentify_items.dart';
import 'package:fltwrite/pages/personal/subpages/base_item_change.dart';
import 'package:fltwrite/pages/personal/subpages/change_profile.dart';
import 'package:fltwrite/pages/personal/subpages/identify_change.dart';
import 'package:fltwrite/pages/register/create_user.dart';
import 'package:fltwrite/pages/register/index.dart';
import 'package:fltwrite/pages/take_photo/index.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> wroutes = {
  '/': (BuildContext context) => IntroPage(),
  '/editPage': (BuildContext context) => EditPage(),
  '/personal': (BuildContext context) => PersonalPage(),
  '/changeProfile': (BuildContext context) => ChangeProfile(),
  '/baseItemChange': (BuildContext context) => BaseItemChange(),
  '/identifyChange': (BuildContext context) => IdentifyChange(),
  '/takePhoto': (BuildContext context) => ImagePickerWidget(),
  '/render': (BuildContext context) => RenderPage(),
  '/addBaseItem': (BuildContext context) => AddBaseItems(),
  '/addIdentifyItem': (BuildContext context) => AddIdentifyItems(),
  '/register': (BuildContext context) => RegisterPage(),
  '/createUser': (BuildContext context) => CreateUser(),
};
