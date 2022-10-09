import 'dart:html';
import '../utils/utility.dart';
import '../api/user_api.dart';

void main() async{
  var userSession = await getUserSession();
  setCartCount(userSession.orderID);
  setTitle('Admin Account');

 /*
  var range = querySelector('#range');
  range?.onChange.listen((event) {
  var value = (event.currentTarget as InputElement).value;
  var label = range.nextElementSibling;
  label?.text = value;
  });
  */
  var values = {'full': '100', 'semi-full': '50', 'low': '10','out of stock': '0'};
  // Animate Bar Charts // 
  var bars = querySelectorAll('.bars li .bar');
  for (var bar in bars) {
      var value = bar.attributes['data-percentage'];
      value = '10';
      bar.style.height = '$value%';
      bar.style.transition = '3s';
      bar.attributes['data-text'] = 'Low';
  }

}




