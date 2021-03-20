import 'package:fltwrite/pages/edit/index.dart';
import 'package:fltwrite/pages/intro/index.dart';
import 'package:fltwrite/route/index.dart';
import 'package:fltwrite/store/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:fltwrite/route/index.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: storeProviders,
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(828, 1792),
        builder: () => MaterialApp(
              routes: wroutes,
              initialRoute: '/',
              navigatorKey: WRoute.navigatorKey,
              onGenerateRoute: (settings) {
                return new MaterialPageRoute(builder: wroutes[settings.name]);
              },
              onUnknownRoute: (RouteSettings setting) {
                return null;
              },
            ));
  }
}
