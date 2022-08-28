import 'dart:convert';
import '../model/item.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';

var host = Host();
Future<Item> getItem(String id) async{
    final url = Uri.http(host.url, "flowers/id");
    final response = await http.get(url);
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var itemJson = jsonDecode(response.body);
      return Item.fromJson(itemJson);
    }
}


Future<List<Item>> getItems() async{
    final url = Uri.http(host.url, "flowers");
    final response = await http.get(url);
    List<Item> flowers = [];
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var itemsJson = jsonDecode(response.body);
      for (var item in itemsJson) {
        flowers.add(Item.fromJson(item));
      }

      return flowers;
    }
}
