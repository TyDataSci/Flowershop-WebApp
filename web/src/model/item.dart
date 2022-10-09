

class Item {

final int id;
String type;
String description; 
String price;
String image;


Item(this.id, this.type, this.description, this.price, this.image); 

Item.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    type = json['type'],
    description = json['description'],
    price = json['price'],
    image = json['image'];

Map<String, dynamic> toJson() => {
  'id': id,
  'type' : type,
  'description' : description,
  'price' : price,
  'image' : image,
};


List<Item> castListItems(List<dynamic> genericList) {
  List<Item> items = [];
  for (var generic in genericList) {
      var newItem = Item.fromJson(generic);
      items.add(newItem);
    }
      return items;
  }

}