import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fltwrite/common/wpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPage extends WPage {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends WPageState {
  final String barTitle = "编辑";
  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension = 'docx';
  bool _loadingPath = false;
  bool _multiPick = true;
  FileType _pickingType = FileType.custom;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void postRequestFunction2() async {
    String url = "http://127.0.0.1:5000/uploadDocx/";

    ///创建Dio
    Dio dio = new Dio();
    FormData formdata = FormData.fromMap({
      "title0": "实验目的",
      "title1": "实验内容",
      "title2": "主要仪器设备",
      "title3": "实验步骤",
      "title4": "实验总结",
      "files": [
        await MultipartFile.fromFile(
            _paths.map((e) => e.path).toList()[0].toString()),
      ]
    });

    ///发起post请求
    Response response = await dio.post(url, data: formdata);

    var data = response.data;
    print(data);
  }

  @override
  Widget buildBody(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      await _openFileExplorer();
                      await postRequestFunction2();
                    },
                    child: const Text("Open file picker"),
                  ),
                  ElevatedButton(
                    onPressed: () => _clearCachedFiles(),
                    child: const Text("Clear temporary files"),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (BuildContext context) => _loadingPath
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const CircularProgressIndicator(),
                    )
                  : _directoryPath != null
                      ? ListTile(
                          title: const Text('Directory path'),
                          subtitle: Text(_directoryPath),
                        )
                      : _paths != null
                          ? Container(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: Scrollbar(
                                  child: ListView.separated(
                                itemCount: _paths != null && _paths.isNotEmpty
                                    ? _paths.length
                                    : 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final bool isMultiPath =
                                      _paths != null && _paths.isNotEmpty;
                                  final String name = 'File $index: ' +
                                      (isMultiPath
                                          ? _paths
                                              .map((e) => e.name)
                                              .toList()[index]
                                          : _fileName ?? '...');
                                  final path = _paths
                                      .map((e) => e.path)
                                      .toList()[index]
                                      .toString();

                                  return ListTile(
                                    title: Text(
                                      name,
                                    ),
                                    subtitle: Text(path),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                              )),
                            )
                          : const SizedBox(),
            ),
          ],
        ),
      ),
    ));
  }
}
