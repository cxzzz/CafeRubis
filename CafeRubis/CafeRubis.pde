/*
 Labtest 1
 Student no: C16434996
 Name: Chenxi Zhang
*/

void setup() {
  size(800, 600);
  border = 100;
  gap = 50;
  total = 0.00f;
  x2 = width / 2 + 30;
  y2 = border + 50;
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

float border; // border
float gap; // gap between rect
float x, y; // drawing rect
float rectW, rectH; // rect W and H
float x1, y1; // detect mousepressed
float x2, y2; // for bill
float total;
boolean status;

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

void mousePressed() {
  for (int i = 0; i < products.size(); i++) {
    // find the center of each rects
    x1 = x + rectW / 2;
    y1 = map(i, 0, 7, border, height - border);
    y1 = y1 + rectH / 2;
    // if is inside the rect
    if (dist(x1, y1, mouseX, y1) < rectW / 2) {
      if (dist(x1, y1, x1, mouseY) < rectH / 2) {
        // check that will not go over 10 as shown in video, 
        // because it will go over the canvas!
        if (bill.size() < 10) {
          Product b = products.get(i);
          bill.add(b);
          total += b.price;
        }
      }
    }
  }
}

void displayBill() {
  // DRAW BILL MENU
  fill(255);
  stroke(0);    
  rect(width / 2 + 20, border, width / 2 - 20 - border, height - border * 2);
  fill(0);
  text("Your Bill", width / 2 * 1.33, border + 15); 
  // search for bill arraylist (if there exist an item, draw it
  for (int i = 0; i < bill.size(); i++) {
    // get bill
    Product b = bill.get(i);
    fill(0);
    // print bill name and bill text
    y2 = map(i, 0, 11, border + 50, height - border);
    text(b.name, x2, y2);
    text(nf(b.price,1,2), (x2 + width / 2 - 20 - border) * 0.9f, y2);
  }
  // print total below it
  text("Total:", x2, y2 + 25);
  text(nf(total, 1, 2), (x2 + width / 2 - 20 - border) * 0.9f, y2 + 25);
}


void draw() {
  displayProducts();
  displayBill();
}