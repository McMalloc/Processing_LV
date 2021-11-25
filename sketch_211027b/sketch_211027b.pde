PImage moominSprite, kodamaSprite;
Character[] characters = new Character[2];
int activeIndex = -1;

void setup() {
  size(500, 500);
  
  moominSprite = loadImage("moomin.png");
  kodamaSprite = loadImage("kodama.png");
  characters[0] = new Character(moominSprite, 50, 50, "Moomin 1");
  characters[1] = new Character(kodamaSprite, 300, 50, "Kodama 2");
} //<>//

void mousePressed() {
  activeIndex = -1;
  for (int i = 0; i < characters.length; i++) {
    if (characters[i].wasClicked(mouseX, mouseY)) {
      activeIndex = i;
    }
  }
}

void draw() {
  background(0);
  
  for (int i = 0; i < characters.length; i++) {
    boolean isActive = activeIndex == i; 
    characters[i].display(isActive);
  }
  
}
