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

  final _$baseItemKeysAtom = Atom(name: '_FileStore.baseItemKeys');

  @override
  ObservableList<dynamic> get baseItemKeys {
    _$baseItemKeysAtom.reportRead();
    return super.baseItemKeys;
  }

  @override
  set baseItemKeys(ObservableList<dynamic> value) {
    _$baseItemKeysAtom.reportWrite(value, super.baseItemKeys, () {
      super.baseItemKeys = value;
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
  Map<String, dynamic> get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(Map<String, dynamic> value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  final _$editWidgetsAtom = Atom(name: '_FileStore.editWidgets');

  @override
  List<EditWidget> get editWidgets {
    _$editWidgetsAtom.reportRead();
    return super.editWidgets;
  }

  @override
  set editWidgets(List<EditWidget> value) {
    _$editWidgetsAtom.reportWrite(value, super.editWidgets, () {
      super.editWidgets = value;
    });
  }

  final _$_FileStoreActionController = ActionController(name: '_FileStore');

  @override
  void addBaseItem(List<FileItem> items) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.addBaseItem');
    try {
      return super.addBaseItem(items);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reorderBase(int oldIndex, int newIndex) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.reorderBase');
    try {
      return super.reorderBase(oldIndex, newIndex);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBaseKeyByIndex(int index, String _key) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.changeBaseKeyByIndex');
    try {
      return super.changeBaseKeyByIndex(index, _key);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBaseValueByIndex(int index, String _value) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.changeBaseValueByIndex');
    try {
      return super.changeBaseValueByIndex(index, _value);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addIdentifyItem(List<String> items) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.addIdentifyItem');
    try {
      return super.addIdentifyItem(items);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reorderIdentify(int oldIndex, int newIndex) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.reorderIdentify');
    try {
      return super.reorderIdentify(oldIndex, newIndex);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIdentifyByIndex(int index, String _value) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.changeIdentifyByIndex');
    try {
      return super.changeIdentifyByIndex(index, _value);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToShow(dynamic _map) {
    final _$actionInfo =
        _$_FileStoreActionController.startAction(name: '_FileStore.addToShow');
    try {
      return super.addToShow(_map);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearEditWidgets() {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.clearEditWidgets');
    try {
      return super.clearEditWidgets();
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEditWidget(EditWidget _widget) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.addEditWidget');
    try {
      return super.addEditWidget(_widget);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void insertEditWidget(int index, EditWidget _widget) {
    final _$actionInfo = _$_FileStoreActionController.startAction(
        name: '_FileStore.insertEditWidget');
    try {
      return super.insertEditWidget(index, _widget);
    } finally {
      _$_FileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
baseItemList: ${baseItemList},
baseItemKeys: ${baseItemKeys},
identifyItemList: ${identifyItemList},
show: ${show},
editWidgets: ${editWidgets}
    ''';
  }
}
