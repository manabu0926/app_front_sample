import 'package:http/http.dart' as http;

class UserApi {
  Future<http.Response> getUser(String token) async {
    Map<String, String> headers = {'authorization': "Bearer $token"};
    var url = Uri.parse("http://localhost:3000/users/current");

    return await http.get(url, headers: headers);
  }
}
