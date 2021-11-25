
// KONSTANTEN für Fensterbreite, -höhe und Karogröße
final int WIDTH = 1000;
final int HEIGHT = 1000;

// setup() wird von processing genau 1x am Anfang aufgerufen 
void setup() {
  // Fenstergröße setzen und P2D als Renderer setzen,
  // also 2D und hardwarebeschleunigt
  size(1000, 1000, P2D);
  background(0);
}

// draw() wird pro Frame 1x aufgerufen (~30 bis 60 fps)
void draw() {  
  noStroke();
  
  fill(255);
  for (int i = 0; i < 100; i++) {
    // circle(random(0, WIDTH), random(0, HEIGHT), 2);
    
    circle(
      map(randomGaussian(), -1, 1, 0, WIDTH), 
      map(randomGaussian(), -1, 1, 0, HEIGHT), 
      2
    );
  }
}
