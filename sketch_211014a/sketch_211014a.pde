final int WIDTH = 1280;
final int HEIGHT = 800;

final int BLOCK_WIDTH = 30;
final int BLOCK_HEIGHT = 30;
final int PADDING = 3;

final int SENSIBILITY = 2;

int baseRed = 50;
int baseGreen = 190;
int baseBlue = 128;

final int MIN_RADIUS = 1;
final int MAX_RADIUS = 50;
int radius = MIN_RADIUS;

import processing.sound.*;
AudioIn micIn;
Amplitude amp;

void setup() {
    size(1280, 800, P2D);
    background(0);
    smooth();
    
    micIn = new AudioIn(this, 6);
    amp = new Amplitude(this);
    micIn.start();
    amp.input(micIn);
    
    print(Sound.list());
    //frameRate(12);
}

int modulateColor(int input) {
  return max(min(input + (int)random( -5,5), 255), 0);
}

float getDistance(int col, int row) {
  int blockX = mouseX / BLOCK_WIDTH;
  int blockY = mouseY / BLOCK_HEIGHT;
  
  return sqrt(
    (col-blockX) * (col-blockX) +
    (row-blockY) * (row-blockY)
  );
}

int increase(int radius) {
  return min(MAX_RADIUS, radius + SENSIBILITY);
}


int decrease(int radius) {
  return max(MIN_RADIUS, radius - SENSIBILITY);
}

void draw() {
  
  
    background(0);
    strokeWeight(PADDING);
    
    for (int col = 0; col < WIDTH / BLOCK_WIDTH; col++) {
      for (int row = 0; row < HEIGHT / BLOCK_HEIGHT; row++) {
        baseGreen = modulateColor(baseGreen);
        baseBlue = modulateColor(baseBlue);
        baseRed = modulateColor(baseRed);
      
        // fill(baseRed, baseGreen, baseBlue, getDistance(col, row));
        // fill(baseRed, baseGreen, baseBlue, 255 - getDistance(col, row) * 4);
        fill(baseRed, baseGreen, baseBlue, 255);
        
        rect(col * BLOCK_WIDTH, row * BLOCK_HEIGHT, BLOCK_WIDTH, BLOCK_HEIGHT);
      }
    }
    
    println(amp.analyze());
    
    baseGreen = modulateColor(baseGreen);
    baseBlue = modulateColor(baseBlue);
    baseRed = modulateColor(baseRed);
        
    fill(baseRed, baseGreen, baseBlue);
    
    if (mousePressed) {
      radius = increase(radius);
    } else {
      radius = decrease(radius);
    }
   
    
    noStroke();
    circle(
        mouseX + random( -2, 2), 
        mouseY + random( -2, 2), 
        radius
       );
       
    /*
    fill(0);
    rect(0,0,250,30);
    textSize(24);
    fill(255);
    text("(" + baseRed + "," + baseGreen + "," + baseBlue + ")", 10, 20);
    */
}
