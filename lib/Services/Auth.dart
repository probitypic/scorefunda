import 'package:http/http.dart' as http;

class AuthApi {
  Future<http.Response> signInApi(String phoneNo, String password) async {
    var url = Uri.parse('http://restsf.nullplex.co.in/api/login');
    var params = {'mobile': phoneNo, 'password': password, 'deviceid': '1234'};
    http.Response response = await http.post(url, body: params);
    return response;
  }

  Future<http.Response> signUp(
      String name, String phoneNo, String password) async {
    var url = Uri.parse('http://restsf.nullplex.co.in/api/register');
    var params = {
      'name': name,
      'mobile': phoneNo,
      'password': password,
      'deviceid': '1234'
    };

    http.Response res = await http.post(url, body: params);
    return res;
  }

  Future<http.Response> ValidateOtp(String mobile, String otp) async {
    var url = Uri.parse('http://restsf.nullplex.co.in/api/verifyOtp');
    var params = {'mobile': mobile, 'otp': otp};
    http.Response res = await http.post(url, body: params);
    return res;
  }

  Future<http.Response> SignUpInfo(
      String dob, String email, String token) async {
    var url = Uri.parse('http://restsf.nullplex.co.in/api/registerinfo');
    var params = {'dob': dob, 'email': email, 'token': token};
    http.Response res = await http.put(url, body: params);
    return res;
  }
}
