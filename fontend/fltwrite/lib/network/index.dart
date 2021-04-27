import 'package:dio/dio.dart';

class HttpResponse {
  int statusCode;
  Map data;
  HttpResponse(this.statusCode, this.data);
}

class HttpManager {
  String url = "http://192.168.0.100:5000";

  String checkUrl(String path) {
    if (path.substring(0, 4) == 'http' || path.substring(0, 5) == 'https') {
      return path;
    } else {
      return url + path;
    }
  }

  Future<dynamic> postManager(String path, Map postData) async {
    FormData formdata = FormData.fromMap(postData);
    Dio dio = new Dio();
    try {
      var response = await dio.post(checkUrl(path), data: formdata);
      var data = Map<String, dynamic>.from(response.data);
      return HttpResponse(response.statusCode, data);
    } on DioError catch (e) {
      print(
          '-------------------------------------------------------------------------------------------------------');
      print('network error:');
      print(e.toString());
      return e;
    }
  }
}
