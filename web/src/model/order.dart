import '../api/item_api.dart';
import '../model/item.dart';
import 'dart:convert';

class Order {

final String id;
String date; 
String userID;
List<Item> items;
String deliveryType;
String note;
String instructions;
String totalCost;



Order(this.id, this.date,this.userID, this.items,
 this.deliveryType,this.note, this.instructions, this.totalCost); 

Order.fromJson(Map<String, dynamic> json)
  : id =  json['id'],
    date = json['date'],
    userID = json['userid'],
    items = castListItems(json['items']),
    deliveryType = json['deliverytype'],
    note = json['note'],
    instructions = json['instructions'],
    totalCost = json['totalcost'];

Map<String, dynamic> toJson() => {
  'id':             id,
  'date' :          date,
  'userid' :        userID,
  'items' :         items,
  'delivertype' :   deliveryType,
  'note' :          note,
  'instructions' :  instructions,
  'totalcost' :     totalCost,
};

void addItem (String itemID) async{
  var addItem = await getItem(itemID);
  items.add(addItem);
}
  

}

List<Item> castListItems(List<dynamic> genericList) {
  List<Item> items = [];
  for (var generic in genericList) {
      var newItem = Item.fromJson(generic);
      items.add(newItem);
    }
      return items;
  }
