// Util function to set title
import 'dart:html';

import '../api/order_item_api.dart';

  void setTitle(String string) {
     querySelector('#title')?.text = string;
  }

void hideCartCount() {
    var cartCount = querySelector('#cart-count');  
    cartCount?.classes.add('hide');
}

void setCartCount(int orderID) async{
    var cartCount = querySelector('#cart-count');
    int count = 0;
    var cartItems = await getOrderItems(orderID);
    count = cartItems.length;
   
        if (count > 0) {
          cartCount?.classes.remove('hide');
        }
        else {
          cartCount?.classes.add('hide');
        }
          cartCount?.innerText = count.toString();
    }
    

    

    

