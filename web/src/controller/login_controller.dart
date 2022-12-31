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
        querySelector('.checkbox-content')?.text ='Incorrect username or password.';
        }   
      }      
  else {
    querySelector('.checkbox-content')?.text = 'Username and password are required';
    } 
  });


  var registerButton = (querySelector('#register-button') as InputElement);
registerButton.onClick.listen((event) async {
  var name = (querySelector('.register-name') as InputElement).value;
  var email = (querySelector('.register-email') as InputElement).value;
  var createPassword = (querySelector('.password-create') as InputElement).value;
  var confirmPassword = (querySelector('.password-confirm') as InputElement).value;
  if (name !=null && name.isNotEmpty && email !=null && email.isNotEmpty 
  && createPassword != null && createPassword.isNotEmpty && confirmPassword != null && confirmPassword.isNotEmpty) {
      if (createPassword == confirmPassword ){
          var user = User(0, name, email, createPassword);
          await createUser(user);
          querySelector('.register-textbox')?.text ='Registering now.';
          await Future.delayed(Duration(seconds: 1));
          querySelector('.register-textbox')?.text ='Registering now..';
          await Future.delayed(Duration(seconds: 1));
          querySelector('.register-textbox')?.text ='Registering now...';
          await Future.delayed(Duration(seconds: 1));
          await validateUser(user);
          window.location.replace('order.html');
        }
      else{
        querySelector('.register-textbox')?.text ='Confirmation password does not match.';
        }   
      }      
  else {
    querySelector('.register-textbox')?.text = 'All fields are required';
    } 
  });



}