import 'package:fltwrite/pages/edit/index.dart';
import 'package:fltwrite/store/index.dart';
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
    return ScreenUtilInit(
        designSize: Size(1792, 828),
        builder: () => MaterialApp(
              home: EditPage(),
            ));
  }
}
