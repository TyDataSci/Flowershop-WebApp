import 'dart:html';
import '../api/order_item_api.dart';
import '../api/user_api.dart';
import '../utils/utility.dart';
//import '../api/item_api.dart';
import '../model/item.dart';

void main() async {

var userSession = await getUserSession();
setTitle('Your Cart');
hideCartCount();
setCartCount(userSession.orderID);



void displayCart(List<Item> items) async{ 
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



Future<List<Item>> removeItem(String productID) async {
  var list = await removeOrderItem(userSession.orderID, productID);     
  setCartCount(userSession.orderID);
  return list;
}

displayCart(await getOrderItems(userSession.orderID));

var cartProducts = querySelectorAll('.cart-products');
  for (var cartProduct  in cartProducts) {
      var removeButton = (cartProduct.querySelector('.remove-product') as ButtonElement);
        removeButton.onClick.listen((event) {
            cartProduct.classes.add('hide');
            removeItem(cartProduct.id);
      });
    }


}