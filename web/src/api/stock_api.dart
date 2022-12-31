import 'dart:convert';
import '../model/stock.dart';
import 'package:http/http.dart' as http;
import 'api_host.dart';

var host = InventoryHost();

Future<List<Stock>> getInventory() async{
    final url = Uri.https(host.url, "stock");
    final response = await http.get(url);
    List<Stock> inventory = [];
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting inventory');

    }
    else {
      var stocksJson = jsonDecode(response.body);
      for (var stock in stocksJson) {
        inventory.add(Stock.fromJson(stock));
      }

      return inventory;
    }
}

Future<List<Stock>> getDemo() async{
    final url = Uri.https(host.url, "demo");
    final response = await http.get(url);
    List<Stock> inventory = [];
   
    //print('Response status: ${response.statusCode}');
    if (response.statusCode != 200){

      throw Exception('Error getting inventory');

    }
    else {
      var stocksJson = jsonDecode(response.body);
      for (var stock in stocksJson) {
        inventory.add(Stock.fromJson(stock));
      }

      return inventory;
    }
}
