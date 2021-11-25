// setzt die Füllfarbe auf zufällige Werte (0 bis 255) für alle drei Farbkanäle
void randomColor() {
  fill(random(0,255), random(0,255), random(0,255));
}

// KONSTANTEN für die minimale und maximale Kreisgröße
final int MINSIZE = 10;
final int MAXSIZE = 50;
int size = MINSIZE;

// setup() wird von processing genau 1x am Anfang aufgerufen 
void setup() {
  size(800, 600, P2D);
  
  // eine kleine while-Schleife, die nur die Zahlen 1 bis 10 auf der Konsole ausgibt
  // keine Auswirkung auf den Sketch
  int i = 0;
  while (i < 10) {
    i = i + 1;
    println(i);
  }
}

void draw() {
  // vor jedem zu zeichnenden Frame alles mit Schwraz übermalen
  background(0);
  
  // ohne Rände malen
  noStroke();
  
  // Wenn die Maustaste gedrückt zu diesem Zeitpunkt gedrückt ist ...
  if (mousePressed == true) {
    // Während die Maustaste gedrückt ist, springt die draw()-Funktion
    // immer in diesen Block
    randomColor();
    // Variable für den Kreis immer größer werden lassen
    size = min(size + 1, MAXSIZE);
    // Kreis malen, mit zappelnden Koordinaten
    circle(
      mouseX + random(-10, 10), 
      mouseY + random(-10, 10), 
      size
    );
  // ... und wenn nicht
  } else {
    // Wenn keine Maustaste gedrückt ist, wird size zurückgesetzt 
    // (immer wieder)
    size = MINSIZE;
  }
}
