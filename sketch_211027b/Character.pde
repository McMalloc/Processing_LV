class Character {
  float xPos, yPos, width, height;
  String moniker;
  PImage sprite;
  
  Character(PImage sprite, int x, int y, String name) {
    xPos = x;
    yPos = y;
    moniker = name;
    this.sprite = sprite;
    
    float ratio = abs((float)sprite.width / (float)sprite.height);
    
    height = 200;
    width = height * ratio; //<>//
  }
  
  boolean wasClicked(int x, int y) {
    if (x > xPos && x < xPos + width && y > yPos && y < yPos + height) {
      return true;
    } else {
      return false;
    } 
  }
  
  void display(boolean isActive) {
    if (isActive) {
      rect(xPos, yPos, width, height);
    }
    image(sprite,xPos,yPos,width,height);
    fill(255);
    text(moniker, xPos, yPos); 
  }
}
