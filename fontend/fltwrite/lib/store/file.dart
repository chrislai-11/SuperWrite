import 'package:mobx/mobx.dart';
part 'file.g.dart';

class FileStore = _FileStore with _$FileStore;

abstract class _FileStore with Store {
  @observable
  List show = [];
  @action
  void addShowDoc(List _doc) {
    show.add(_doc);
  }
}
