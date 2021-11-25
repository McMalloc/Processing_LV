final int HEIGHT = 500;
final int WIDTH = 500;
final int TEXTSIZE = 30;
String[] colornames = new String[3];

void setup() {
  size(500, 500);
  
  colornames[0] = "red";
  colornames[1] = "green";
  colornames[2] = "blue";
}

void draw() {
  background(0);
  textSize(TEXTSIZE);
  
  for (int i = 0; i < colornames.length; i++) {
    text(colornames[i], 100, 100 * i + TEXTSIZE);
  }

}
