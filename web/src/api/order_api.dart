import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/order.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';

var host = Host();
Future<Order> getOrder(String id) async{
    final url = Uri.https(host.url, "orders/$id");
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
    final url = Uri.https(host.url, "orders");
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

void updateOrder(Order order) async{
  final url = Uri.https(host.url, "orders/$order.id");
  var orderJson = order.toJson();
  final response = await http.put(url, 
                                  body:json.encode(orderJson));
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error updating order');

    }
    
}

void completeOrder(int userID) async{
  final url = Uri.https(host.url, "orders/$userID/completed");
  var dio = Dio();
    dio.options.extra['withCredentials'] = true;
    try {
      await dio.put(url.toString());
    }
    catch (e) {
      throw Exception('Error updating order');
    }
    
}

