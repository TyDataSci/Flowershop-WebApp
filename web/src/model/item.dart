class Item {

final String id;
String type;
String description; 
String price;
String image;
Map<String, dynamic> inventory;


Item(this.id, this.type, this.description, this.price, this.image,this.inventory); 

Item.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    type = json['type'],
    description = json['description'],
    price = json['price'],
    image = json['image'],
    inventory = json['inventory'];

Map<String, dynamic> toJson() => {
  'id': id,
  'type' : type,
  'description' : description,
  'price' : price,
  'image' : image,
  'inventory' : inventory
};

}