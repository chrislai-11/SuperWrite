import 'package:mobx/mobx.dart';
part 'profile.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  String nickname = "小可爱";
  @action
  void setNickname(_name) {
    nickname = _name;
  }

  @observable
  String school = "暨南大学";
  void setSchool(_school) {
    school = _school;
  }

  @observable
  String avatuar = "assets/image/dinasaur.jpg";
  void setAvatuar(_path) {
    avatuar = _path;
  }

  @observable
  String major = "物联网工程";
  void setMajor(_major) {
    major = _major;
  }

  @observable
  String telephone = "18127278888";
  void setTelephone(_number) {
    telephone = _number;
  }
}
