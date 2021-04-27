import 'package:fltwrite/common/wpage.dart';
import 'package:fltwrite/pages/personal/components/add_input_widget.dart';
import 'package:fltwrite/store/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBaseItems extends WPage {
  @override
  _AddBaseItemsState createState() => _AddBaseItemsState();
}

class _AddBaseItemsState extends WPageState {
  final String barTitle = "添加";
  final bool hasBottomBar = false;
  FileStore fileStore = FileStore();
  List<Widget> inputs = [];
  int addCount = 0;
  List<String> addingLabels = [];
  List<String> addingValues = [];

  @override
  void initState() {
    super.initState();
    fileStore = this.$store('file');
    addInputWidget();
  }

  void addInputWidget() {
    addingLabels.add('');
    addingValues.add('');
    inputs.add(AddInputWidget(
        label: addCount, labelChange: addingLabels, valueChange: addingValues));
    addCount++;
  }

  @override
  Widget buildBody(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  56.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 100.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ...inputs,
                    OutlinedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 100.h)),
                        ),
                        onPressed: () {
                          addInputWidget();
                          setState(() {});
                        },
                        child: Icon(Icons.add))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 90.h),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 100.h)),
                      ),
                      onPressed: () {
                        print(addingLabels);
                        print(addingValues);
                        List<FileItem> temp = [];
                        for (int i = 0; i < addingLabels.length; i++) {
                          temp.add(FileItem(addingLabels[i], addingValues[i]));
                          fileStore.addBaseItem(temp);
                        }
                        Navigator.pop(context);
                      },
                      child: Text("提交")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
