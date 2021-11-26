// importieren der Serial Funktionen
import processing.serial.*;

// zwei ArrayLists des Typs Integer 
// (ArrayList begnügt sich aus Gründen nicht mit dem int-Typ)
// ArrayLists können ihre Länge beliebig ändern 
ArrayList<Integer> valuesA = new ArrayList<Integer>();
ArrayList<Integer> valuesB = new ArrayList<Integer>();

Serial arduino; 

// Funktion mit Boilerplate zum Öffnen eines seriellen Ports
// Schließt den Port, falls er schonmal geöffnet worden ist
void initSerial() {
  if (arduino != null) {
    arduino.stop();
  }
  print("Serielle Ports: "); printArray(Serial.list());
  arduino = new Serial(this, Serial.list()[0], 9600);
  // Der Port liest bis zu einem Zeilenumbruch, bevor das serialEvent
  // ausgelöst wird
  arduino.bufferUntil('\n');
}

// Wenn Leertaste gedrückt wird, Port neu einrichten
void keyPressed() {
  if (keyCode == 32) {
    initSerial();
  }
}

void setup() {
  size(1600, 800);
  initSerial();
}

void serialEvent(Serial arduino) {
  // Nachricht auslösen und Whitespaces (den Zeilenumbruch) abschneiden
  String message = trim(arduino.readString());
  // Wert aus der Nachricht lesen, alles ab dem 3 Zeichen
  int value = parseInt(message.substring(2));
  
  // Wenn das erste Zeichen ein A war, in die ArrayList für A
  // an Stelle 0, alle anderen Werte rutschen eins auf
  if (message.charAt(0) == 'A') {
    valuesA.add(0, value);
    
    // Wenn die ArrayList groß genug ist, das älteste Element
    // entfernen
    if (valuesA.size() > 100) {
      valuesA.remove(valuesA.size() - 1);
    }
  // Für B analog
  } else if (message.charAt(0) == 'B') {
    valuesB.add(0, value);
    
    if (valuesB.size() > 100) {
      valuesB.remove(valuesB.size() - 1);
    }
  }
}

void drawGraph(ArrayList<Integer> values, color strokeColor) {
  noFill();
  stroke(strokeColor);
  strokeWeight(2);
  beginShape();
  for (int i = 0; i < values.size(); i++) {
    // Der Länge nach die Werte abzeichnen
      vertex(
        (float)i / values.size() * width, 
        map(values.get(i), 0, 120, height, 0)
      );
  }
  endShape();
}

void draw() {
  background(0);
  
  // Der Code zum Zeichnen einer Wertereihe ist immer derselbe,
  // daher in Funktion auslagern mit der ArrayList und einem Farbwert
  // als Parameter
  drawGraph(valuesA, color(200, 50, 100));
  drawGraph(valuesB, color(100, 200, 100));
  
}
