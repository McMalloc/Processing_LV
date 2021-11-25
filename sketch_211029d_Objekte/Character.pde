/* Die Klasse Character repräsentiert Figuren, die einem Namen
   einen Ort und ein renderbares Bild haben.
   Klassen können zu Objekten instantiiert werden. Der Code für die
   Klasse hier beschreibt, wie ein beliebiges Objekt der Klasse
   aussieht und wie es sich verhält. Erst die instanziierten Objekte
   ("Instanzen") in der anderen Datei haben konkrete Werte für z.B. den Ort.
 */
class Character {
  // Mögliche Eigenschaften der Objekteder Klasse Character
  PImage sprite;
  String name;
  float x;
  float y;
  float angle = 0;
  float width;
  float height;
  boolean wasClicked = false; // direkt zugewiesene Werte sind "default"
  
  // Die Konstruktor-Funktion
  Character(int x, int y, int width, String name, String spriteUrl) {
    // triviales Zuweisen der übergebenen Argumente
    // "this" bezieht sich immer auf die aktuelle Instanz,
    // hier notwendig, da die Argumente genauso heißen wie die 
    // Objekteigenschaften
    this.x = x;
    this.y = y;
    this.name = name;
    this.width = width;
    
    // Der Konstruktor wird nur einmal pro Objekt, bei dessen
    // Instanziierung, aufgerufen. Daher bietet es sich an,
    // hier Ressourcen wie Bilder zu laden.
    sprite = loadImage(spriteUrl);
    
    // Berechnen des korrekten Seitenverhältnisses (aus den Eigenschaften 
    // width und height des PImage-Objekts). Da sich das 
    // Seitenverhältnis maximal so oft ändert wie das Bild,
    // kann auch der daraus errechnete Wert für die Höhe
    // im Konstruktor gesetzt werden.
    float ratio;
    if (sprite.height > sprite.width) {
      ratio = (float)sprite.height / (float)sprite.width;
    } else {
      ratio = (float)sprite.width / (float)sprite.height;
    }
    
    height = width * ratio;
  }
  
  // Diese Methode prüft, ob der letzte Klick innerhalb der 
  // begrenzenden Box (die sich aus x, y, width und height ergibt)
  // stattfand.
  void wasClicked() {
    boolean verticalInside = mouseY > y && mouseY < y + height;
    boolean horizontalInside = mouseX > x && mouseX < x + width;
    
    if (verticalInside && horizontalInside) {
      wasClicked = true;
    } else {
      wasClicked = false;
    }
    
    // eleganter?
    // wasClicked = verticalInside && horizontalInside;
  }
  
  // Individuelle Zeichenfunktion für Characters, die in der
  // draw() des Hauptprogramms einzeln aufgerufen wird
  void display() {
    // Wenn das Objekt weiß, dass es geklickt worden ist,
    // soll es sich farblich abheben
    if (wasClicked) {
      fill(120);
      rect(x, y, width, height);    
    }
    
    // Zustand des Koordinatensystems (die Leinwand) merken
    push();
    
    // Koordinatensystem zur Mitte der gewünschten Position
    // verschieben.
    translate(x + width/2, y + height / 2);
    // Koordinatensystem drehen um 45°, umgewandelt in Radianten
    // mit radians().
    // Die Zahl Pi entspricht umgerechnet nicht ganz zufällig 180°,
    // also wäre auch rotate(PI / 4) möglich.
    rotate(radians(angle));
    
    // Da wir das gesamte Koordinatensystem bereits
    // an die gewünschte Position des Character verschoben haben,
    // müssen wir den Sprite am Ursprung zeichnen, nochmal 
    // in die Mitte des Bildes verschoben.
    image(sprite, 0 - width/2, 0 - height/2, width, height);
    
    // Koordinatensystem zurücksetzen
    pop();
    
    // Das Label soll nicht rotiert werden, daher nach pop()
    // Da auch die Translation rückgängig gemacht worden ist,
    // müssen für die Koordinaten wieder die tatsächlichen 
    // Werte eingetragen werden.
    fill(255);
    text(name, x, y + height + 30);
  }
}
