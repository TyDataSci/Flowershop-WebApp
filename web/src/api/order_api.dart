import 'dart:convert';
import '../model/order.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';

var host = Host();
Future<Order> getItem(String id) async{
    final url = Uri.http(host.url, "orders/id");
    final response = await http.get(url);
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var orderJson = jsonDecode(response.body);
      return Order.fromJson(orderJson);
    }
}


Future<List<Order>> getOrders() async{
    final url = Uri.http(host.url, "orders");
    final response = await http.get(url);
    List<Order> orders = [];
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting username');

    }
    else {
      var ordersJson = jsonDecode(response.body);
      for (var order in ordersJson) {
        orders.add(Order.fromJson(order));
      }

      return orders;
    }
}
