class Order {

final int id;
String date; 
int userID;
bool delivery;
bool completed;



Order(this.id, this.date,this.userID, this.delivery,this.completed); 

Order.fromJson(Map<String, dynamic> json)
  : id =  json['id'],
    date = json['date'],
    userID = json['userid'],
    delivery = json['delivery'],
    completed = json['completed'];

Map<String, dynamic> toJson() => {
  'id':             id,
  'date' :          date,
  'userid' :        userID,
  'delivery' :      delivery,
  'completed' :     completed,

};

void addItem (String itemID) async{
}
  

}


