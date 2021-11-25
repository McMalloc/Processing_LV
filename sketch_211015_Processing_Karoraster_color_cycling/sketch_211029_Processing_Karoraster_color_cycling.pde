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

// Ein Array mit Farbdaten
color[] palette = new color[5];

// setup() wird von processing genau 1x am Anfang aufgerufen 
void setup() {
  // Fenstergröße setzen und P2D als Renderer setzen,
  // also 2D und hardwarebeschleunigt
  size(800, 400, P2D);
  
  // nur 4 Frames die Sekunde
  frameRate(4);
  
  palette[0] = color(0,0,50);
  palette[1] = color(0,10,90);
  palette[2] = color(0,20,120);
  palette[3] = color(0,30,180);
  palette[4] = color(0,40,220);
}

// draw() wird pro Frame 1x aufgerufen (~30 bis 60 fps)
void draw() {  
  // ohne Rände malen
  noStroke(); //<>//
  
  // Eine for-Schleife: Laufvariable definiert; Laufbedingung; Schrittweite
  // erst die Spalten des Karorasters durchzählen ...
  for (int column = 0; column <= WIDTH / BLOCKSIZE; column++) { 
    
    // ... dann die Zeilen
    for (int row = 0; row <= HEIGHT / BLOCKSIZE; row++) {

      // Die Füllfarbe aus dem Array mit den Farbdaten beziehen, abhängig
      // von Zeilen- und Spaltennummer, sowie der aktuellen Framenummer.
      // Geteilt durch die Länge der Palette (Anzahl der Einträge im Array),
      // aber davon nur der Rest (Modulo, %), sodass der Index nie größer
      // als das Array wird
      fill(palette[(row + column + frameCount) % palette.length]);
      
      // Dann die Karos zeichnen, immer versetzt (also multipliziert) um ihre jeweilige Position
      rect(column * BLOCKSIZE, row * BLOCKSIZE, BLOCKSIZE, BLOCKSIZE);
    }
  }
}
