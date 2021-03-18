import 'package:fltwrite/pages/intro/index.dart';
import 'package:fltwrite/pages/edit/index.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => IntroPage(),
  '/editPage': (BuildContext context) => EditPage(),
};
