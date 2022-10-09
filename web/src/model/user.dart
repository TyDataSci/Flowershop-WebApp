class User {

final int id;
String username;
String name;
String password; 

User(this.id, this.username,this.name, this.password); 

User.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    username = json['username'],
    name = json['name'],
    password = json['password'];

Map<String, dynamic> toJson() => {
  'id': id,
  'username' : username,
  'name' : name,
  'password' : password,
};

}