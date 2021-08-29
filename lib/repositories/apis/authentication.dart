import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getUserApi(String path) async {
  final token = await FirebaseAuth.instance.currentUser!.getIdToken();

  Map<String, String> headers = {'authorization': "Bearer $token"};
  var url = Uri.parse("http://localhost:3000/$path");

  return await http.get(url, headers: headers);
}
