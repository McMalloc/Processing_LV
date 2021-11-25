// Globale Konstanten
final int HEIGHT = 800;
final int WIDTH = 800;
final int TEXTSIZE = 30;

// alt: Bildvariablen der Charaktere
// PImage moomin;
// PImage kodama;

// Ein Array, reserviert mit Platz für zwei Objekte der Klasse Character
Character[] characters = new Character[2];

// Callback-Funktion, wenn die Maus/Trackpad gedrückt wird 
void mousePressed() {
  for (int i = 0; i < characters.length; i++) {
    // für jeden nummerierten Sitzplatz i im Array wird die Funktion
    // wasClicked() des Objekts, was auf dem Sitzplatz sitzt, ausgeführt.
    // Was die Funktion genau macht, ist dieser Callback egal.
    characters[i].wasClicked();
  }
}

// Callback-Funktion für Tastatureingaben
void keyPressed() {
  for (int i = 0; i < characters.length; i++) {
    if (characters[i].wasClicked) {
      switch(keyCode) {
        case 65: 
          characters[i].angle -= 1;
          break;
        case 68: 
          characters[i].angle += 1;
          break;
      }
    };
  }
  
  
}

void setup() {
  size(800, 800, P2D);
 
  // alt: Laden der Bilder
  // moomin = loadImage("moomin.png");
  // kodama = loadImage("kodama.png");
  
  // Auf die Sitzpltze im Array werden ein Moomin und eine Kodama platziert
  // mit Hilfe unserer Character-Klasse. Die Figuren ("Objekte") werden von
  // der Klasse mit der Konstruktor-Funktion instanziiert.
  characters[0] = new Character(0, 0, 200, "Moomin", "moomin.png");
  characters[1] = new Character(500, 0, 100, "Kodama", "kodama.png"); //<>//
}

void draw() {
  background(0);
  textSize(TEXTSIZE);
  
  for (int i = 0; i < characters.length; i++) {
    // für jeden nummerierten Sitzplatz i im Array wird die Funktion
    // display() des Objekts, was auf dem Sitzplatz sitzt, ausgeführt.
    characters[i].display();
  }
  
  /* alt: Zeichenlogik für die Bilder
  float ratio;
  if (kodama.height > kodama.width) {
    ratio = (float)kodama.height / (float)kodama.width;
  } else {
    ratio = (float)kodama.width / (float)kodama.height;
  }
  
  // float ratio =  (float)kodama.height / (float)kodama.width;
  
  // image(moomin, 0, 0, 300, 300);
  image(kodama, 0, 300, 300, 300 * ratio); //<>//
  */
}
