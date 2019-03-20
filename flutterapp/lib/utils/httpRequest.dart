import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "http://192.168.56.1:3001";
// const baseUrl = "http://flutterapi.chenshiservice.cn";

class HttpUtil {
  post(String url, {Map params}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token") == null
        ? ""
        : preferences.getString("token");
    var data;
    try {
      data = await http.Client()
          .post("$baseUrl$url",
              headers: {"Authorization": "Bearer " + token},
              body: json.encode(params))
          .then((res) {
        return json.decode(res.body);
      });
    } catch (error) {
      return error;
    }
    return data;
  }
}
