class Drop {
  int maxSize = 3000;
  float size = 0; 
  int birthTime = millis();
  int lifespan = 5000;
  float relativeAge = 0;
  boolean invisible = false;
  
  color youngColor;
  color oldColor;
  
  float x;
  float y;
  
  Drop(float x, float y) {
    this.x = x;
    this.y = y;
    
    youngColor = palette[round(random(0, palette.length - 1))];
    oldColor = palette[round(random(0, palette.length - 1))];
  }
  
  void display() {
    if (!invisible) {
      relativeAge = (millis() - birthTime) / (float)lifespan;
      size = maxSize * relativeAge;
      fill(lerpColor(youngColor, oldColor, relativeAge * 3), 255 * (1 - relativeAge));
      noStroke();
      circle(x, y, size);
      
      if (size > maxSize) invisible = true;
    }
  }
}
