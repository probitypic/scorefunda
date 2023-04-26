import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetHomeScreenApis {
  Future<http.Response> getBanner() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();

    var url =
        Uri.parse('http://restsf.nullplex.co.in/api/getbanner?token=$token');
    http.Response response = await http.get(url);

    return response;
  }

  Future<http.Response> getCategories() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();

    var url = Uri.parse(
        'http://restsf.nullplex.co.in/api/getcategories?token=$token');

    http.Response response = await http.get(url);
    // print(response.body);
    return response;
  }

  Future<http.Response> getQuizes() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    var url = Uri.parse(
        'http://restsf.nullplex.co.in/api/getpopularquizzes?token=$token');
    http.Response response = await http.get(url);
    return response;
  }

  Future<http.Response> getRecommendedQuizes() async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();

    var url = Uri.parse(
        'http://restsf.nullplex.co.in/api/getrecommendedquizzes?token=$token');
    http.Response response = await http.get(url);
    return response;
  }
}
