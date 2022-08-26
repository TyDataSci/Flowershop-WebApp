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
  // Create a status of in stock, out of stock, low inventory
  var volumeStatus = HeadingElement.h5();
  volumeStatus.innerHtml = 'In Stock';
  //volumeStatus.innerHtml = 'Out of Stock';
  //volumeStatus.innerHtml = 'Limited Inventory';
  volumeStatus.id = 'in-stock';
  //volumeStatus.id = 'out-stock';
  //volumeStatus.id = 'limited-inventory';
  // Create img element for container
  var image = Element.img();
  image.attributes['src'] = flower['image']!;
  // Set volume status as child of image container
  imageContainer.children.add(volumeStatus);
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
  // Display button to add to cart 
  var addToCart = ButtonElement();
  var span = Element.span();
  span.innerHtml = 'Add to Cart ';
  var iElement  = Element.tag('i');
  iElement.classes.add('fa');
  iElement.classes.add('fa-shopping-basket');
  // Set name as child of card container
  cardContainer.children.add(name);
  // Set price as child of card container
  cardContainer.children.add(price);
  // Add span and iElement to Add To Cart button
  addToCart.children.add(span);
  addToCart.children.add(iElement);
  // add button to add to cart
  cardContainer.children.add(addToCart);
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




