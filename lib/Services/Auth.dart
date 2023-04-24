import 'package:http/http.dart' as http;

class AuthApi {
  Future<http.Response> signInApi(String phoneNo, String password) async {
    var url = Uri.parse('http://restsf.nullplex.co.in/api/login');
    var params = {'mobile': phoneNo, 'password': password, 'deviceid': '1234'};
    http.Response response = await http.post(url, body: params);
    return response;
  }
}
