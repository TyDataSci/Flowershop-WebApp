import 'dart:html';
import '../api/item_api.dart';
import '../api/order_item_api.dart';
import '../api/user_api.dart';
import '../api/order_api.dart';
import '../utils/utility.dart';
//import '../api/item_api.dart';
import '../model/item.dart';

void main() async {
var subtotal = 0.00; 
double getTax() {
  var tax = subtotal * 0.07;
  return tax;
}

var userSession = await getUserSession();
hideCartCount();
setCartCount(userSession.orderID);
if (userSession.userID == 5){
 querySelector('.admin')?.classes.remove('hide');
}


void displayCart(List<Item> items) async{
  if (items.isNotEmpty) {
    for (var item in items) {
      var cartProduct = Element.div();
      cartProduct.classes.add('cart-products');
      cartProduct.id = item.id.toString();
      //image div
      var imageContainer = Element.div();
      imageContainer.classes.add('box-product');
      // Create img element for container
      var image = Element.img();
      image.attributes['src'] = item.image;
      // Set image as child of imageContainer
      imageContainer.children.add(image);
      // Set imageContainer as child of card
      cartProduct.children.add(imageContainer);

      //Name
      var name = item.description;
      var nameContainer = Element.div();
      nameContainer.classes.add('box-product');
      nameContainer.innerText = name;
      cartProduct.children.add(nameContainer);
      /*/Count //
      var count = "1";
      var countContainer = Element.div();
      countContainer.classes.add('box-product');
      countContainer.innerText = count;
      cartProduct.children.add(countContainer);
      *///Price //
      var price = item.price;
      subtotal = subtotal + double.parse(price);
      var priceContainer = Element.div();
      priceContainer.classes.add('box-product');
      priceContainer.innerText = '\$$price';
      cartProduct.children.add(priceContainer);
      // Remove Button //
      var buttonContainer = Element.div();
      buttonContainer.classes.add('box-product');
      var removeButton = ButtonElement();
      removeButton.classes.add('remove-product');
      //var span = Element.span();
      //span.innerHtml = 'Remove';
      var iElement  = Element.tag('i');
      iElement.classes.add('uil');
      iElement.classes.add('uil-multiply');
      //removeButton.children.add(span);
      removeButton.children.add(iElement);
      buttonContainer.children.add(removeButton);
      cartProduct.children.add(buttonContainer);
      
      // Set cartProduct as child of cart
      querySelector('.cart')?.children.add(cartProduct);
          }
    }
    else {
      setTitle('Your cart is empty');
      querySelector('.cart-total')?.classes.add('hide');
    }
    var tax = getTax();
    var total = subtotal + tax;
    querySelector('#subtotal')?.innerText = subtotal.toStringAsFixed(2);
    querySelector('#tax')?.innerText = tax.toStringAsFixed(2);
    querySelector('#total')?.innerText = '\$${total.toStringAsFixed(2)}';
} 



Future<List<Item>> removeItem(String productID) async {
  var list = await removeOrderItem(userSession.orderID, productID);     
  setCartCount(userSession.orderID);
  return list;
}

displayCart(await getOrderItems(userSession.orderID));

var cartProducts = querySelectorAll('.cart-products');
  for (var cartProduct  in cartProducts) {
      var removeButton = (cartProduct.querySelector('.remove-product') as ButtonElement);
        removeButton.onClick.listen((event) async{
            var item = await getItem(cartProduct.id);
            var price = double.parse(item.price);
            subtotal = subtotal - price;
            var tax = getTax();
            var total = subtotal + tax;
            querySelector('#subtotal')?.innerText = subtotal.toStringAsFixed(2);
            querySelector('#tax')?.innerText = tax.toStringAsFixed(2);
            querySelector('#total')?.innerText = '\$${total.toStringAsFixed(2)}';
            cartProduct.classes.add('hide');
            removeItem(cartProduct.id);
      });
    }


clearCart (){
var cartProducts = querySelectorAll('.cart-products');
  for (var cartProduct  in cartProducts) {
      cartProduct.classes.add('hide');
    }
}


var checkoutButton = querySelector('#checkout-button') as ButtonElement;
checkoutButton.onClick.listen((event) async{
  completeOrder(userSession.userID);
  var saveOrder = userSession.orderID;
  clearCart();
  querySelectorAll('.cart-total').classes.add('hide');
  setTitle('Processing your order.');
  await Future.delayed(Duration(seconds: 1));
  setTitle('Processing your order..');
  await Future.delayed(Duration(seconds: 1));
  setTitle('Processing your order...');
  userSession = await getUserSession();
  querySelector('#title')?.classes.add('hide');
  var cartDiv = querySelector('.cart');
  cartDiv?.classes.add('confirmation');
  var orderComplete = HeadingElement.h1();
  orderComplete.innerText = 'Your order is complete';
  orderComplete.id = 'yourordercomplete';
  var congratsImg = Element.img();
  congratsImg.id = 'congrats';
  congratsImg.attributes['src'] = 'assets/confetti.png';
  var thankYouText = HeadingElement.h3();
  thankYouText.innerText = 'Thank you for your purchase!';
  var orderID = HeadingElement.h5();
  orderID.innerText =  'Your order ID is: 000$saveOrder';
  var notifyText = HeadingElement.h5();
  notifyText.innerText =  'We will notify you as soon as it is ready.';
  cartDiv?.children.add(orderComplete);
  cartDiv?.children.add(congratsImg);
  cartDiv?.children.add(thankYouText);
  cartDiv?.children.add(orderID);
  cartDiv?.children.add(notifyText);
  setCartCount(userSession.orderID);
});
  
      


}