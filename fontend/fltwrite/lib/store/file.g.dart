// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FileStore on _FileStore, Store {
  final _$baseItemListAtom = Atom(name: '_FileStore.baseItemList');

  @override
  ObservableList<dynamic> get baseItemList {
    _$baseItemListAtom.reportRead();
    return super.baseItemList;
  }

  @override
  set baseItemList(ObservableList<dynamic> value) {
    _$baseItemListAtom.reportWrite(value, super.baseItemList, () {
      super.baseItemList = value;
    });
  }

  final _$identifyItemListAtom = Atom(name: '_FileStore.identifyItemList');

  @override
  ObservableList<dynamic> get identifyItemList {
    _$identifyItemListAtom.reportRead();
    return super.identifyItemList;
  }

  @override
  set identifyItemList(ObservableList<dynamic> value) {
    _$identifyItemListAtom.reportWrite(value, super.identifyItemList, () {
      super.identifyItemList = value;
    });
  }

  final _$showAtom = Atom(name: '_FileStore.show');

  @override
  List<dynamic> get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(List<dynamic> value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  final _$_FileStoreActionController = ActionController(name: '_FileStore');

  @override
  void addBaseItem(dynamic _item) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.addBaseItem');
    try {
      return super.addBaseItem(_item);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addIdentifyItem(dynamic _item) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.addIdentifyItem');
    try {
      return super.addIdentifyItem(_item);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addShowDoc(List<dynamic> _doc) {
    final _$actionInfo =
        _$_FileStoreActionController.startAction(name: '_FileStore.addShowDoc');
    try {
      return super.addShowDoc(_doc);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
baseItemList: ${baseItemList},
identifyItemList: ${identifyItemList},
show: ${show}
    ''';
  }
}
