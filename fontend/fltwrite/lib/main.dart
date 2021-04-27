import 'package:fltwrite/common/global.dart';
import 'package:fltwrite/network/index.dart';
import 'package:fltwrite/route/index.dart';
import 'package:fltwrite/store/index.dart';
import 'package:fltwrite/store/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: storeProviders,
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Global.init(context);
    return ScreenUtilInit(
      designSize: Size(828, 1792),
      builder: () => MaterialApp(
        theme: ThemeData(fontFamily: "PingFang", buttonColor: Colors.black),
        routes: wroutes,
        initialRoute: Global.startRoute,
        onGenerateRoute: (settings) {
          return new MaterialPageRoute(builder: wroutes[settings.name]);
        },
        onUnknownRoute: (RouteSettings setting) {
          return null;
        },
      ),
    );
  }
}
