class Session {

final String token;
int userID;
int orderID;
final String expiry;

Session(this.token, this.userID,this.orderID, this.expiry); 

Session.fromJson(Map<String, dynamic> json)
  : token = json['token'],
    userID = json['userid'],
    orderID = json['orderid'],
    expiry = json['expiry'];

Map<String, dynamic> toJson() => {
  'token': token,
  'userid' : userID,
  'orderid' : orderID,
  'expiry' : expiry,
};

}