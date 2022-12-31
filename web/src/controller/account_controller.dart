import 'dart:html';
import '../model/stock.dart';
import '../api/stock_api.dart';

void main() async{
  //var userSession = await getUserSession();
  //setCartCount(userSession.orderID);
 /*
  var range = querySelector('#range');
  range?.onChange.listen((event) {
  var value = (event.currentTarget as InputElement).value;
  var label = range.nextElementSibling;
  label?.text = value;
  });
  */
   
   var inventory = await getDemo();

void displayInventory(List<Stock> inventory) async{ 
  var values = {'full': '100', 'semi-full': '50', 'low': '10','out of stock': '0'};
  for (var item in inventory) {
    var boxes = Element.section();
    boxes.classes.add('boxes');
    //container div
    var container = Element.div();
    container.classes.add('container');
    // box div
    var box = Element.div();
    box.classes.add('box');
    // h2 element for item name
    var h2 = HeadingElement.h2();
    var iElement  = Element.tag('i');
    iElement.classes.add('uil');
    if (item.status == 'low' || item.status == 'out of stock'){
      iElement.classes.add('uil-exclamation-circle');
    }
    else {
      iElement.classes.add('uil-check-circle');
    }
    h2.innerText = item.type;
    h2.children.add(iElement);
    // Semi donut div 
     var semiDonut = Element.div();
    semiDonut.classes.add('semi-donut');
    semiDonut.attributes['style'] = "--percentage:${values[item.status]}; --fill: #FFD700";
    semiDonut.innerText = item.status;
    // Set h2 as child of box
    box.children.add(h2);
    // Set semiDonut as child of box
    box.children.add(semiDonut);
    // image box div
    var imageBox = Element.div();
    imageBox.classes.add('box');
    var image = Element.img();
    image.attributes['src'] = item.image;
    // Set image as child of imagebox
    imageBox.children.add(image);
    // Set box and imageBox as child of container
    container.children.add(box);
    container.children.add(imageBox);
    // Set container as child of boxes 
    boxes.children.add(container);
    // Set boxes as child of boxwrapper
    querySelector('.boxwrapper')?.children.add(boxes);
        }
}   

displayInventory(inventory);

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


