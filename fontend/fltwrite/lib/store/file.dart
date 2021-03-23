import 'package:mobx/mobx.dart';
part 'file.g.dart';

class FileStore = _FileStore with _$FileStore;

class FileItem {
  String key;
  String value;
  FileItem(this.key, this.value);
}

abstract class _FileStore with Store {
  @observable
  ObservableList baseItemList = ObservableList();
  @action
  void addBaseItem(List<FileItem> items) {
    items.forEach((element) {
      baseItemList.add(element);
    });
  }

  @observable
  ObservableMap baseItemMap = ObservableMap();
  @action
  void reflectBaseMap(List<FileItem> items) {
    items.forEach((element) {
      baseItemMap[element.key] = element.value;
    });
  }

  @observable
  ObservableList identifyItemList = ObservableList();
  @action
  void addIdentifyItem(List<String> items) {
    items.forEach((element) {
      identifyItemList.add(element);
    });
  }

  @observable
  List show = [];
  @action
  void addShowDoc(List _doc) {
    show.add(_doc);
  }
}
