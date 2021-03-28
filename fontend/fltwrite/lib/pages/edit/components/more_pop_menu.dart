import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum PopMenuType { download, reload, identify }

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
  MorePopMenu({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return new PopupMenuButton<PopMenuType>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuItem<PopMenuType>>[
        selectView(Icons.download_done_rounded, '下载', PopMenuType.download),
        selectView(Icons.refresh_rounded, '重新识别', PopMenuType.reload),
        selectView(Icons.reorder_rounded, '识别项', PopMenuType.identify),
      ],
      onSelected: (PopMenuType action) {
        // 点击选项的时候
        switch (action) {
          case PopMenuType.download:
            break;
          case PopMenuType.reload:
            break;
          case PopMenuType.identify:
            break;
        }
      },
    );
  }
}
