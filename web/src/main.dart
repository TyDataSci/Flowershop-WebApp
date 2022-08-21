import 'dart:html';

void main() {

  querySelector('#title')?.text = 'Order Flowers';
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
for (var flower in flowers) {
  var card = Element.div();
  card.classes.add('card');
  card.classes.add(flower['type']!);
  //image div
  var imageContainer = Element.div();
  imageContainer.classes.add('image-container');
  // img 
  var image = Element.img();
  image.attributes['src'] = flower['image']!;
  // Set image as child of imageContainer
  imageContainer.children.add(image);
  // Set imageContainer as child of card
  card.children.add(imageContainer);
  // Set card as child of Products
  querySelector('.products')?.children.add(card);
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


//

// Pass parameter from button to filter 
void filterProduct() {
  var buttons = querySelectorAll('.button-value');
  for (var button in buttons) {
    button.onClick.listen((event) {
      var clickedButton  = button.id;
      for (var button in buttons) {
        if (button.id == clickedButton) {
          button.classes.add('active-button');
        }
        else {
          button.classes.remove('active-button'); 
        }
      } 
      var cards = querySelectorAll('.card');
      for (var card in cards) {
        if (clickedButton == 'all'){
          card.classes.remove('hide');
    }
        else {
          if (card.classes.contains(clickedButton)) {
              card.classes.remove('hide');
      }
          else {
             card.classes.add('hide');
      }
    }
   }
    });
  }
} 
filterProduct(); 

// On click of Search button filter by Search Input
var searchButton  = querySelectorAll('#search');
searchButton.onClick.listen((event) {
  var input = (querySelector('#search-input') as InputElement).value;
  var productNames = querySelectorAll('.product-name');
  var cards = querySelectorAll('.card');
  productNames.asMap().forEach((idx, name) {
     if (input != null && input.isNotEmpty) {
        if(name.innerText.toLowerCase().contains(input.toLowerCase())) {
          cards[idx].classes.remove('hide');
        }
        else {
          cards[idx].classes.add('hide');
          }

        }
    });
  });
}




