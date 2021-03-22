// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStore, Store {
  final _$nicknameAtom = Atom(name: '_ProfileStore.nickname');

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  final _$schoolAtom = Atom(name: '_ProfileStore.school');

  @override
  String get school {
    _$schoolAtom.reportRead();
    return super.school;
  }

  @override
  set school(String value) {
    _$schoolAtom.reportWrite(value, super.school, () {
      super.school = value;
    });
  }

  final _$avatuarAtom = Atom(name: '_ProfileStore.avatuar');

  @override
  String get avatuar {
    _$avatuarAtom.reportRead();
    return super.avatuar;
  }

  @override
  set avatuar(String value) {
    _$avatuarAtom.reportWrite(value, super.avatuar, () {
      super.avatuar = value;
    });
  }

  final _$majorAtom = Atom(name: '_ProfileStore.major');

  @override
  String get major {
    _$majorAtom.reportRead();
    return super.major;
  }

  @override
  set major(String value) {
    _$majorAtom.reportWrite(value, super.major, () {
      super.major = value;
    });
  }

  final _$telephoneAtom = Atom(name: '_ProfileStore.telephone');

  @override
  String get telephone {
    _$telephoneAtom.reportRead();
    return super.telephone;
  }

  @override
  set telephone(String value) {
    _$telephoneAtom.reportWrite(value, super.telephone, () {
      super.telephone = value;
    });
  }

  final _$_ProfileStoreActionController =
      ActionController(name: '_ProfileStore');

  @override
  void setNickname(dynamic _name) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setNickname');
    try {
      return super.setNickname(_name);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nickname: ${nickname},
school: ${school},
avatuar: ${avatuar},
major: ${major},
telephone: ${telephone}
    ''';
  }
}
