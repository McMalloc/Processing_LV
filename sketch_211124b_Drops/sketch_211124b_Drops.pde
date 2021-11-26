final int DROP_NUMBER = 100;

Drop[] drops = new Drop[DROP_NUMBER];
int currentIndex = 0;

// Array direkt bei der Definition initialisieren mit einer Liste
// zwischen { und }
color[] palette = {
  color(36, 114, 240),
  color(204, 255, 0),
  color(31, 242, 133),
  color(242, 31, 98),
  color(53, 227, 240),
  color(240, 189, 24),
  color(180, 180, 180)
};

color randomColor() {
  return palette[round(random(0, palette.length - 1))];
}

void setup() {
  size(1600, 800, P2D);
}

void mousePressed(){
  // Bei jedem Klick einen Drop erzeugen
  // Nach und nach füllt sich das Array, aber niemals über seine
  // Größe hinaus dank der Restfunktion %
  drops[currentIndex % DROP_NUMBER] = new Drop(mouseX, mouseY);
  currentIndex++;
}

void draw() {
  background(0);
  noStroke();
  
  for (int i = 0; i < drops.length; i++) {
    // Zu Beginn ist das Array leer und alle bis die meisten Plätze sind null,
    // also noch leer, daher abfangen, bevor wir darauf zugreifen.
    // Alte, unsichtbare Drops werden irgendwann überschrieben und 
    // von Java irgendwann automatisch aus dem Speicher entfernt ("garbage collection")
    if (drops[i] != null && !drops[i].invisible) {
      drops[i].display();
    }
  }
}
