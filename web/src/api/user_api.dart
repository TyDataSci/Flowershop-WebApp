import 'dart:convert';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';

var host = Host();
Future<User> getUser(String username) async{
    final url = Uri.http(host.url, "users/$username");
    final response = await http.get(url);
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var usernameJson = jsonDecode(response.body);
      //print('json data: $usernameJson');
      return User.fromJson(usernameJson);
    }
}
