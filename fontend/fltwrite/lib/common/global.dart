import 'package:fltwrite/store/index.dart';
import 'package:flutter/material.dart';

class Global {
  static Map<String, dynamic> storeMap;

  static void init(BuildContext context) {
    storeMap = createStoreMap(context);
  }
}
