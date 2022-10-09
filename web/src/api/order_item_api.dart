import 'dart:convert';
import '../model/item.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';


var host = Host();
Future<List<Item>> getOrderItems(int orderID) async{
    final url = Uri.https(host.url, "order_items/order=$orderID");
    final response = await http.get(url);
    List<Item> orderItems = [];
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var orderItemsJson = jsonDecode(response.body);
      for (var item in orderItemsJson) {
        orderItems.add(Item.fromJson(item));
      }

      return orderItems;
    }
}


Future<List<Item>>  addOrderItem(int orderID, String itemID) async{
  final url = Uri.https(host.url, "order_items/order=$orderID&item=$itemID");
  final response = await http.post(url);
  List<Item> orderItems = [];
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var orderItemsJson = jsonDecode(response.body);
      for (var item in orderItemsJson) {
        orderItems.add(Item.fromJson(item));
      }

      return orderItems;
    }
    
}

Future<List<Item>>  removeOrderItem(int orderID, String itemID) async{

  final url = Uri.https(host.url, "order_items/order=$orderID&item=$itemID&action=remove");
  final response = await http.put(url);
   List<Item> orderItems = [];
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var orderItemsJson = jsonDecode(response.body);
      for (var item in orderItemsJson) {
        orderItems.add(Item.fromJson(item));
      }

      return orderItems;
    }
}