import 'package:fltwrite/network/index.dart';
import 'package:mobx/mobx.dart';
part 'profile.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  String nickname = "";
  @action
  void setNickname(_name) {
    nickname = _name;
  }

  @observable
  String school = "";
  @action
  void setSchool(_school) {
    school = _school;
  }

  @observable
  String major = "";
  @action
  void setMajor(_major) {
    major = _major;
  }

  @observable
  String email = "1450583197@qq.com";
  @action
  void setEmail(_email) {
    email = _email;
  }

  @action
  Future<void> updateAll(_nickname, _school, _major) async {
    HttpManager httpManager = HttpManager();
    Map<String, dynamic> postData = Map();
    postData['email'] = email;
    postData['nickname'] = _nickname;
    postData['major'] = _major;
    postData['school'] = _school;
    await httpManager.postManager('/updateUser/', postData);
  }

  @action
  Future<void> getAll() async {
    HttpManager httpManager = HttpManager();
    Map<String, dynamic> postData = Map();
    postData['email'] = email;
    var res = await httpManager.postManager('/getUserInformation/', postData);
    if (res.statusCode == 200) {
      major = res.data['major'];
      school = res.data['school'];
      nickname = res.data['nickname'];
    }
  }

  @action
  Future<void> changePwd() async {
    HttpManager httpManager = HttpManager();
    Map<String, dynamic> postData = Map();
    postData['email'] = email;
    await httpManager.postManager('/changePwd/', postData);
  }
}
