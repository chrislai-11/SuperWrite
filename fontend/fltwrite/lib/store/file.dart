import 'package:mobx/mobx.dart';
part 'file.g.dart';

class FileStore = _FileStore with _$FileStore;

class FileItem {
  String key;
  String value;
  FileItem(this.key, this.value);
}

enum EditType { title, content, image }

class EditWidget {
  EditType type;
  dynamic content;
  EditWidget(this.type, this.content);
}

abstract class _FileStore with Store {
  // 基本项
  @observable
  ObservableList baseItemList = ObservableList();
  @observable
  ObservableList baseItemKeys = ObservableList();

  @action
  void addBaseItem(List<FileItem> items) {
    items.forEach((element) {
      if (!baseItemKeys.contains(element.key)) {
        baseItemList.add(element);
        baseItemKeys.add(element.key);
      }
    });
  }

  @action
  void reorderBase(int oldIndex, int newIndex) {
    if (newIndex == baseItemList.length) {
      newIndex = baseItemList.length - 1;
    }
    var item = baseItemList.removeAt(oldIndex);
    var item1 = baseItemKeys.removeAt(oldIndex);
    baseItemList.insert(newIndex, item);
    baseItemKeys.insert(newIndex, item1);
  }

  @action
  void changeBaseKeyByIndex(int index, String _key) {
    baseItemList[index].key = _key;
  }

  @action
  void changeBaseValueByIndex(int index, String _value) {
    baseItemList[index].value = _value;
  }

  // 识别项
  @observable
  ObservableList identifyItemList = ObservableList();
  @action
  void addIdentifyItem(List<String> items) {
    items.forEach((element) {
      if (!identifyItemList.contains(element)) {
        identifyItemList.add(element);
      }
    });
  }

  @action
  void reorderIdentify(int oldIndex, int newIndex) {
    if (newIndex == identifyItemList.length) {
      newIndex = identifyItemList.length - 1;
    }
    var item = identifyItemList.removeAt(oldIndex);
    identifyItemList.insert(newIndex, item);
  }

  @action
  void changeIdentifyByIndex(int index, String _value) {
    identifyItemList[index] = _value;
  }

  @observable
  Map<String, dynamic> show = Map();
  @action
  void addToShow(_map) {
    show = _map;
  }

  @observable
  List<EditWidget> editWidgets = [];
  @action
  void clearEditWidgets() {
    editWidgets = [];
  }

  @action
  void addEditWidget(EditWidget _widget) {
    editWidgets.add(_widget);
  }

  @action
  void insertEditWidget(int index, EditWidget _widget) {
    editWidgets.insert(index, _widget);
  }

  void changeContent(int index, dynamic _content) {
    editWidgets[index].content = _content;
  }
}
