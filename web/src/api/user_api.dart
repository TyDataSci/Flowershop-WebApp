import 'dart:convert';
import '../model/user.dart';
import '../model/session.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';
import 'package:dio/dio.dart';


var host = Host();
Future<User> getUser(String username) async{
    final url = Uri.https(host.url, "users/$username");
    final response = await http.get(url, headers: {"credentials":"include"});
   
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

/*
Future<Session> getUserSession() async{
    final url = Uri.https(host.url, "user");
    final response = await http.get(url);
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting session');

    }
    else {
      var userSessionJson = jsonDecode(response.body);
      //print('json data: $usernameJson');
      return Session.fromJson(userSessionJson);
      
    }
}
*/

Future<Session> getUserSession() async{
  final url = Uri.https(host.url, "user");
  var dio = Dio();
  dio.options.extra['withCredentials'] = true;
  var response = await dio.get(url.toString());
  var userSessionJson = response.data;
  return Session.fromJson(userSessionJson);
}


Future<User> validateUser(User user) async{
    final url = Uri.https(host.url, "user");
    var dio = Dio();
    var package = json.encode(user.toJson());
    dio.options.extra['withCredentials'] = true;
    var response = await dio.post(url.toString(),data: package);
    //var userSessionJson = response.data;
    //final response = await http.post(url,
    //body: package);
   
   // print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){
      print("Login validation failed");
      return user; 

    }
    else {
      //var userJson = jsonDecode(response.body);
      //var userJson = jsonDecode(response.data);
      //print('json data: $usernameJson');
      var userJson = response.data;
      return User.fromJson(userJson);
    }
}
