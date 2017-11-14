/*
  Labtest 1
 Student no: C16434996
 Name: Chenxi Zhang
 */

void setup() {
  size(800, 600);
  border = 100;
  gap = 50;
  // call loadData() in setup
  loadData();
  printProducts();
  // width and height for rectangle
  rectW = 200;
  rectH = (height - border - border - gap) / products.size();
}

// Delcare two global arraylists
ArrayList<Product> products = new ArrayList<Product>();
ArrayList<Product> bill = new ArrayList<Product>();

float border;
float gap;
float x, y;
float rectW, rectH;

void loadData() {
  // Load table from csv file
  Table table = loadTable("cafe.csv", "header");
  // Load and add data into arraylist
  for (TableRow r : table.rows()) {
    Product p = new Product(r);
    products.add(p);
  }
}

void printProducts() {
  // print all products
  for (Product p : products) {
    println(p);
  }
}

void displayProducts() {
  // header (TITLE)
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("Cafe Rubis Till System", width / 2, 50);

  // MENU
  for (int i = 0; i < products.size(); i++) {
    // get product
    Product p = products.get(i); 
    // draw rectangle
    x = border;
    // map function to find the y cordinates
    y = map(i, 0, 7, border, height - border);
    // fill with white and black stroke as shown in video
    fill(255);
    stroke(0);
    rect(x, y, rectW, rectH);
    // print text
    textSize(14);
    textAlign(LEFT);
    fill(0);
    text(p.name, x + 10, y + rectH / 2);
    // format price into one and two decimal places
    text(nf(p.price, 1, 2), x + rectW * 0.8f, y + rectH / 2);
    
    // DRAW MIDDLE BAR
    line(width / 2, border, width /2, height - border);
  }
}


void draw() {
  displayProducts();
}