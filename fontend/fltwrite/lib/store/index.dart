import 'package:fltwrite/store/file.dart';
import 'package:flutter/material.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> storeProviders = [
  Provider(create: (_) => FileStore()),
  Provider(create: (_) => ProfileStore()),
];

Map<String, dynamic> createStoreMap(BuildContext context) {
  return {
    'file': Provider.of<FileStore>(context),
    'profile': Provider.of<ProfileStore>(context),
  };
}
