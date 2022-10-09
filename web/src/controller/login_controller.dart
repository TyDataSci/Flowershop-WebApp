import 'dart:html';
import '../model/user.dart';
import '../api/user_api.dart';


void main() async{
await getUserSession();
// Show Hide Password on click of change icon // 
var showHideIcons =  querySelectorAll('.showHidePw');
var passFields =  querySelectorAll('.password');
for (var icon in showHideIcons) {
  {
  icon.onClick.listen((event) {
    for (var field in passFields) { 
      if (field.attributes['type'] == 'password') {
        field.attributes['type'] = 'text';
        icon.classes.remove('uil-eye-slash');
        icon.classes.add('uil-eye');
      }
      else {
        field.attributes['type'] = 'password';
        icon.classes.remove('uil-eye');
        icon.classes.add('uil-eye-slash');
       }
     }
    });
  }
 }

 // Show register form on click of Sign up here // 
  var containerLogin = querySelector('.container-login');
  var signUp = querySelector('.signup-link');
  var login = querySelector('.login-link');

  signUp?.onClick.listen((event) {
    containerLogin?.classes.add('active');
  });
  login?.onClick.listen((event) {
    containerLogin?.classes.remove('active');
  });

var loginButton = (querySelector('#login-button') as InputElement);
loginButton.onClick.listen((event) async {
  var email = (querySelector('.email') as InputElement).value;
  var password = (querySelector('.password') as InputElement).value;
  if (email !=null && email.isNotEmpty && password != null && password.isNotEmpty) {
     var loginUser = User(0,email,"",password);
     var user = await validateUser(loginUser);
      if (user.id != 0){
          window.location.replace('order.html');
        }
      else{
          querySelector('#title')?.text ='login failed';
        }   
      }      
  else {
    querySelector('#title')?.text = 'Username and password are required';
    } 
  });

}