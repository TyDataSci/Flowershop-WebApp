class Stock {

final String type;
final String status; 
String image;


Stock(this.type, this.status, this.image);

Stock.fromJson(Map<String, dynamic> json)
  : type = json['type'],
    status = json['status'],
    image = json['image'];

Map<String, dynamic> toJson() => {
  'type' : type,
  'status' : status,
  'image' : image,
  };
}

Map<String, String> stockTypeStatus(List<Stock> stockList) {
   Map<String,String> stockTypeStatus = {};
  for (var stock in stockList) {
      var stockType = stock.type;
      var stockStatus = stock.status;
      stockTypeStatus[stockType] = stockStatus;
    }
      return stockTypeStatus;
  }