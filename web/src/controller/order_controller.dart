
import 'dart:html';
import '../api/item_api.dart';
import '../api/order_item_api.dart';
import '../api/user_api.dart';
import '../api/stock_api.dart';
import '../model/item.dart';
import '../model/stock.dart';
import '../utils/utility.dart';


void main() async {
var userSession = await getUserSession();
setCartCount(userSession.orderID);
if (userSession.userID == 5){
 querySelector('.admin')?.classes.remove('hide');
}
var stockStatus = stockTypeStatus(await getInventory());

  var displayStatusText = {'full':'In Stock',
                       'semi-full':'In Stock',
                       'low':'Limited',
                       'out of stock': 'Out of Stock',
                       'none': 'Out of Stock'};
  var displayStatusID = {'full':'in-stock',
                  'semi-full':'in-stock',
                  'low':'limited-inventory',
                 'out of stock': 'out-stock',
                 'none': 'out-stock'};

var flowers = await getItems();
for (var flower in flowers) {
  var card = Element.div();
  card.classes.add('card');
  card.classes.add(flower.type);
  // Card ID 
  card.id = flower.id.toString();
  //image div
  var imageContainer = Element.div();
  imageContainer.classes.add('image-container');
  // Create a status of in stock, out of stock, low inventory
  var volumeStatus = HeadingElement.h5();
  var status = stockStatus[flower.type];
  // Handle a scenario of null status in dict lookup
  status ??= 'none';
  var displayText = displayStatusText[status]!;
  var displayID  = displayStatusID[status]!;
  // Set card flower display text
  volumeStatus.innerHtml = displayText;
  // Set card flower status id
  volumeStatus.id = displayID;
  // Create img element for container
  var image = Element.img();
  image.attributes['src'] = flower.image;
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
  name.innerText = flower.description.toUpperCase();
  // Display price of arrangement
  var price = HeadingElement.h6();
  price.innerText = '\$${flower.price}';
  // Display button to add to cart 
  var addToCart = ButtonElement();
  addToCart.classes.add('addtocart-button');
  // Display Hide button if Status reason is Out of Stock
  if (displayID == 'out-stock'){
    addToCart.classes.add('hide');
  }
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

Future<List<Item>> addItem(String productID) async {
  var list = await addOrderItem(userSession.orderID, productID);     
  setCartCount(userSession.orderID);
  return list;
}

var cartProducts = querySelectorAll('.card');
  for (var cartProduct  in cartProducts) {
      var addButton = (cartProduct.querySelector('.addtocart-button') as ButtonElement);
        addButton.onClick.listen((event) {
           //var productID = cartProduct.id;
           addItem(cartProduct.id);
       
      });
    }



}
