import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<http.Response> getUser(String path) async {
    final token = await FirebaseAuth.instance.currentUser!.getIdToken();

    Map<String, String> headers = {'authorization': "Bearer $token"};
    var url = Uri.parse("http://localhost:3000/users/current");

    return await http.get(url, headers: headers);
  }
}
