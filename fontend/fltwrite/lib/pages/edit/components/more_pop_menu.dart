import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PopMenuType { download, identify }

Widget selectView(IconData icon, String text, PopMenuType id) {
  return new PopupMenuItem<PopMenuType>(
      value: id,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 10.w, right: 50.w),
              child: Icon(icon, color: Colors.blue)),
          Text(text),
        ],
      ));
}

class MorePopMenu extends StatelessWidget {
  final Function download;
  final Function identify;
  MorePopMenu({Key key, this.download, this.identify}) : super(key: key);
  Widget build(BuildContext context) {
    return new PopupMenuButton<PopMenuType>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuItem<PopMenuType>>[
        selectView(Icons.download_done_rounded, '下载', PopMenuType.download),
        selectView(Icons.reorder_rounded, '识别项', PopMenuType.identify),
      ],
      onSelected: (PopMenuType action) {
        // 点击选项的时候
        switch (action) {
          case PopMenuType.download:
            download();
            break;
          case PopMenuType.identify:
            break;
        }
      },
    );
  }
}
