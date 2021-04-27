import 'dart:io';

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String title;
  final File path;
  ImageContainer({
    Key key,
    this.title = "",
    @required this.path,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.file(path),
    );
  }
}
