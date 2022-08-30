// Util function to set title
import 'dart:html';

  void setTitle(String string) {
     querySelector('#title')?.text = string;
  }

void hideCartCount() {
    var cartCount = querySelector('#cart-count');  
    cartCount?.classes.add('hide');
}

void updateCartCount(int increment) {
    var cartCount = querySelector('#cart-count');

    var count = int.parse(cartCount!.innerText);
    if (count > 0  && increment < 0) {
      count = count - increment;
    }
    else if (increment > 0){
      count = count + increment;
    }

    if (count > 0) {
      cartCount.classes.remove('hide');
    }
    else {
      cartCount.classes.add('hide');
    }
    
    cartCount.innerText = count.toString();
}