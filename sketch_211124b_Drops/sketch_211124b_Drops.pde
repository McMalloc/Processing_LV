final int DROP_NUMBER = 100;

Drop[] drops = new Drop[DROP_NUMBER];
int currentIndex = 0;

color[] palette = {
  color(36, 114, 240),
  color(204, 255, 0),
  color(31, 242, 133),
  color(242, 31, 98),
  color(53, 227, 240),
  color(240, 189, 24),
  color(180, 180, 180)
};

void setup() {
  size(1600, 800, P2D);
}

void mousePressed(){
  drops[currentIndex % DROP_NUMBER] = new Drop(mouseX, mouseY);
  currentIndex++;
}

void draw() {
  background(0);
  // blendMode(SUBTRACT);
  
  for (int i = 0; i < drops.length; i++) {
    if (drops[i] != null && !drops[i].invisible) {
      drops[i].display();
    }
  }
}
