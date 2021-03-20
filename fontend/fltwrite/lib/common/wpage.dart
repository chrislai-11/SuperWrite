import 'package:flutter/material.dart';

class WPage extends StatefulWidget {
  WPage({Key key}) : super(key: key);

  @override
  WPageState createState() => WPageState();
}

class WPageState extends State<WPage> {
  final bool hasAppBar = true;
  final bool hasBottomBar = true;
  final String barTitle = "";
  final int currIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget buildAppBar(BuildContext context) {
    return null;
  }

  Widget buildBody(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: hasAppBar
          ? AppBar(
              title: Text(barTitle),
              leading: null,
            )
          : this.buildAppBar(context),
      body: this.buildBody(context),
      bottomNavigationBar: hasBottomBar
          ? BottomNavigationBar(
              currentIndex: currIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: "首页",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.edit_outlined),
                    label: "编辑",
                    backgroundColor: Colors.blue),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    label: "我的",
                    backgroundColor: Colors.blue),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (route) => false);
                    break;
                  case 1:
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/editPage', (route) => false);
                    break;
                  case 2:
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/personal', (route) => false);
                    break;
                  default:
                }
              },
            )
          : null,
    );
  }
}
