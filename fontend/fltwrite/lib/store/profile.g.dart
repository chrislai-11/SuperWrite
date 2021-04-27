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

  final _$emailAtom = Atom(name: '_ProfileStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$updateAllAsyncAction = AsyncAction('_ProfileStore.updateAll');

  @override
  Future<void> updateAll(dynamic _nickname, dynamic _school, dynamic _major) {
    return _$updateAllAsyncAction
        .run(() => super.updateAll(_nickname, _school, _major));
  }

  final _$getAllAsyncAction = AsyncAction('_ProfileStore.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$changePwdAsyncAction = AsyncAction('_ProfileStore.changePwd');

  @override
  Future<void> changePwd() {
    return _$changePwdAsyncAction.run(() => super.changePwd());
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
  void setSchool(dynamic _school) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setSchool');
    try {
      return super.setSchool(_school);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMajor(dynamic _major) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setMajor');
    try {
      return super.setMajor(_major);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic _email) {
    final _$actionInfo = _$_ProfileStoreActionController.startAction(
        name: '_ProfileStore.setEmail');
    try {
      return super.setEmail(_email);
    } finally {
      _$_ProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nickname: ${nickname},
school: ${school},
major: ${major},
email: ${email}
    ''';
  }
}
