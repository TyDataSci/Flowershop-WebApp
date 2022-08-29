import 'dart:html';
import '../utils/utility.dart';
import '../api/item_api.dart';
import '../model/item.dart';

void main()async {
  setTitle('Your Cart');

// Create shopping catalog for flowers
List<Item> items = [];
items.add(await getItem("FL1RA"));
items.add(await getItem("FL1LA"));
items.add(await getItem("FL1CA"));
for (var item in items) {
  var cartProduct = Element.div();
  cartProduct.classes.add('cart-products');
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




