import 'package:mobx/mobx.dart';
part 'file.g.dart';

class DefineItem {
  String key;
  String value;

  DefineItem(this.key, this.value);
}

class FileStore = _FileStore with _$FileStore;

abstract class _FileStore with Store {
  @observable
  DefineItem baseItemList;
  @action
  void addBaseItem(key, value) {}

  @observable
  ObservableList identifyItemList = ObservableList();
  @action
  void addIdentifyItem(List _items) {
    _items.forEach((element) {
      baseItemList.add(element);
    });
  }

  @observable
  List show = [];
  @action
  void addShowDoc(List _doc) {
    show.add(_doc);
  }
}
