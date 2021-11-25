final int WIDTH = 1000;
final int HEIGHT = 1000;

void setup() {
  size(1000, 1000, P2D);
  background(0);
}

void draw() {  
  noStroke();
  
  fill(255);
  for (int i = 0; i < 100; i++) {
    
    /* Statt zufällig gleichverteilte Koordinaten für die Kreise
       nehmen wir normalverteilte (aus der gaussschen Normalverteilung)
       Werte, die sich um 0 herum häufen. map() bildet das dann auf
       unsere Leinwandgröße ab.
       https://de.wikipedia.org/wiki/Normalverteilung
    */
    circle(
      map(randomGaussian(), -5, 5, 0, WIDTH), 
      map(randomGaussian(), -5, 5, 0, HEIGHT), 
      2
    );
  }
}
