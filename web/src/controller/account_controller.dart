import 'dart:html';
import '../utils/utility.dart';

void main() {
  setTitle('Admin Account');

 /*
  var range = querySelector('#range');
  range?.onChange.listen((event) {
  var value = (event.currentTarget as InputElement).value;
  var label = range.nextElementSibling;
  label?.text = value;
  });
  */

  // Animate Bar Charts // 
  var bars = querySelectorAll('.bars li .bar');
  for (var bar in bars) {
      var value = bar.attributes['data-percentage'];
      bar.style.height = '$value%';
      bar.style.transition = '3s';
  }
//Create shopping catalog for flowers
/* 
var flowers = [
  {
    "productName": "Rose Arrangement",
    "price": "30",
    "type" : "rose",
    "image": "assets/flowers/rosearrangement.jpg"
  },
   {
    "productName": "Daisy Arrangement",
    "price": "30",
    "type" : "daisy",
    "image": "assets/flowers/rosearrangement.jpg"
  },
  {
     "productName": "Lily Arrangement",
    "price": "30",
    "type" : "lily",
    "image": "assets/flowers/rosearrangement.jpg"
  },
   {
     "productName": "Carnation Arrangement",
    "price": "30",
    "type" : "carnation",
    "image": "assets/flowers/rosearrangement.jpg"
  }

];
*/
}




