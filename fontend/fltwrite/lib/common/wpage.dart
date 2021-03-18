import 'package:flutter/material.dart';

class WPage extends StatefulWidget {
  WPage({Key key}) : super(key: key);

  @override
  WPageState createState() => WPageState();
}

class WPageState extends State<WPage> {
  final bool hasAppBar = true;
  final String barTitle = "";

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
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
