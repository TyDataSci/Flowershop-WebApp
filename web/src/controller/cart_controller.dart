import 'dart:html';
import '../utils/utility.dart';

void main() {
  setTitle('Your Cart');

// Create shopping catalog for flowers
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
    "image": "assets/flowers/daisyarrangement.jpg"
  },
  {
     "productName": "Lily Arrangement",
    "price": "30",
    "type" : "lily",
    "image": "assets/flowers/lilyarrangement.jpg"
  },
   {
     "productName": "Carnation Arrangement",
    "price": "30",
    "type" : "carnation",
    "image": "assets/flowers/carnationarrangement.jpg"
  },
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
    "image": "assets/flowers/daisyarrangement.jpg"
  },
  {
     "productName": "Lily Arrangement",
    "price": "30",
    "type" : "lily",
    "image": "assets/flowers/lilyarrangement.jpg"
  },
   {
     "productName": "Carnation Arrangement",
    "price": "30",
    "type" : "carnation",
    "image": "assets/flowers/carnationarrangement.jpg"
  }

];
for (var flower in flowers) {
  var card = Element.div();
  card.classes.add('card');
  card.classes.add(flower['type']!);
  //image div
  var imageContainer = Element.div();
  imageContainer.classes.add('image-container');
  // Create img element for container
  var image = Element.img();
  image.attributes['src'] = flower['image']!;
  // Set image as child of imageContainer
  imageContainer.children.add(image);
  // Set imageContainer as child of card
  card.children.add(imageContainer);
  // Set card as child of Products
  querySelector('.cart-products')?.children.add(card);
  // Create Card Container
  var cardContainer = Element.div();
  cardContainer.classes.add("card-container");
  // Display name of arrrangement
  var name = HeadingElement.h5();
  name.classes.add('product-name');
  name.innerText = flower['productName']!.toUpperCase();
  // Display price of arrangement
  var price = HeadingElement.h6();
  price.innerText = '\$${flower['price']!}';
  // Set name as child of card container
  cardContainer.children.add(name);
  // Set price as child of card container
  cardContainer.children.add(price);
  // Set card container as child of card
  card.children.add(cardContainer);

}
}




