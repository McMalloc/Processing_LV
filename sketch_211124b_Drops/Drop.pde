class Drop {
  int posX;
  int posY;
  color startColor;
  color endColor;
  boolean invisible;
  float size;
  int birthTime;
  int lifeSpan = 3000;

  Drop(int x, int y) {
    posX = x;
    posY = y;
    
    // Jeder Drop merkt sich, zu welcher Millisekunde er erstellt worden ist
    birthTime = millis();
    
    size = random(1000, 5000);
    
    // siehe Main für die Funktion
    startColor = randomColor();
    endColor = randomColor();
  }
  
  void display() {
    // das aktuelle Alter in Millisekunden
    float currentAge = (float)millis() - birthTime;
    // Das Verhältnis von Alter zu Lebenserwartung ist das relative Alter zwischen 0 und 1
    float relativeAge = currentAge / (float)lifeSpan;
    
    // Wenn der Drop zu alt wird, muss Processing ihn nicht mehr transparent zeichnen
    if (relativeAge > 1) {
      invisible = true;
    }
        
    // Zeichenparameter anhand des relativen Alters manipulieren
    fill(
      lerpColor(startColor, endColor, relativeAge * 3),
      (1 - relativeAge) * 255
    );
    circle(posX, posY, relativeAge * size);
  }
}
