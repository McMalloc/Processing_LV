// Summenfunktion
// mit Rückgabewert Ganzzahl, und Signatur für zwei Ganzzahlen
// als Parameter
int doSum(int a, int b) {
  int sum;
  sum = a + b;
  return sum;
}
// Stellt auf eine zufällige Farbe im RGB-Raum um
void randomColor() {
  fill(random(0,255), random(0,255), random(0,255));
}

// KONSTANTEN für Fensterbreite, -höhe und Karogröße
final int WIDTH = 800;
final int HEIGHT = 400;
final int BLOCKSIZE = 50;
color[] swatch = new color[5];

// setup() wird von processing genau 1x am Anfang aufgerufen 
void setup() {
  // Fenstergröße setzen und P2D als Renderer setzen,
  // also 2D und hardwarebeschleunigt
  size(800, 400, P2D);
  
  // nur 4 Frames die Sekunde
  frameRate(4);
  
  swatch[0] = color(50,50,50);
  swatch[1] = color(80,50,50);
  swatch[2] = color(50,20,120);
  swatch[3] = color(50,0,200);
  swatch[4] = color(0,150,50);
}

// draw() wird pro Frame 1x aufgerufen (~30 bis 60 fps)
void draw() {  
  // ohne Rände malen
  noStroke();
  
  // Eine for-Schleife: Laufvariable definiert; Laufbedingung; Schrittweite
  // erst die Spalten des Karorasters durchzählen ...
  for (int column = 0; column <= WIDTH / BLOCKSIZE; column++) { 
    
    // ... dann die Zeilen
    for (int row = 0; row <= HEIGHT / BLOCKSIZE; row++) {
      // randomColor();
      fill(swatch[(row + column) % 5]);
      
      // Dann die Karos zeichnen, immer versetzt (also multipliziert) um ihre jeweilige Position
      if (column > 5) {
        // Karos in den Spalten ab 6 kriegen Karos ohne Rand
        rect(column * BLOCKSIZE, row * BLOCKSIZE, BLOCKSIZE, BLOCKSIZE);
      } else {
        // Karos in den Spalten 0 bis 5 haben einen kleinen Rand, da sich das Raster mit
        // den gleichen Längen aufbaut, aber etwas schmaler und kürzer sind
        rect(column * BLOCKSIZE, row * BLOCKSIZE, BLOCKSIZE-2, BLOCKSIZE-2);
      }
    }
  }

  // alternative for-Schleifen:
  // es werden nicht die konzeptuellen Spalten und Reihen des Karomusters durchgezählt,
  // sondern die Pixel. Bei jedem Durchlauf werden die Laufvariablen nicht hochgezählt, sondern
  // um die Karogröße erhöht
  /*
  for (int pixelX = 0; pixelX <= WIDTH; pixelX = pixelX + BLOCKSIZE) {
    for (int pixelY = 0; pixelY <= HEIGHT; pixelY = pixelY + BLOCKSIZE) {
      randomColor();
      rect(pixelX, pixelY, BLOCKSIZE, BLOCKSIZE);
    }
  }
  */
}
