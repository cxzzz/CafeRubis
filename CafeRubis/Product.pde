class Product {
  String name;
  float price;

  Product(TableRow row) {
    name = row.getString("Name");
    price = row.getFloat("Price");
  }
  
  String toString() {
    return "Name: " + name + " Price: " + price;  
  }
}