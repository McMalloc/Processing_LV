JSONObject data;
String cityname = "Magdeburg";

PFont blackFont;
PFont regFont;

final int WIDTH = 1200;
final int HEIGHT = 800;

// Gesamtzahl aller verfügbarer Farben, die aus den drei Keyfarben interpoliert (generiert) werden
final int STEPS = 64;
// Index, an dem die Farbe für gemßigte Temperaturen stehen soll
final int KEY = STEPS/2;
color[] palette = new color[STEPS];

void setup() {
  size(1200, 800, P2D);
  
  String appId = ""; // App ID, die ihr nach der Registrierung bei https://openweathermap.org bekommt
  // Daten im JSON-Format von der API per URL laden
  data = loadJSONObject(
    "http://api.openweathermap.org/" + // Host
    "data/2.5/weather" + // Endpoint oder Method
    "?q=" + cityname + // Parameter und Wert
    "&appid=" + appId + // Zugangsschlüssel
    "&units=metric" // optionale Parameter
  );
  
  // Schicke Fonts laden
  blackFont = createFont("Hezaedrus-Black.ttf", 120);
  regFont = createFont("Hezaedrus-Regular.ttf", 40);
  
  // Die drei Eckfarben der Farbpalette
  color icy = color(0, 4, 255);
  color temperate = color(246, 204, 53);
  color scorching = color(246, 68, 11);
  
  // Das Palettenarray der Lnge nach mit interpolierten Farben füllen
  for (int i = 0; i < STEPS; i++) {
    if (i < KEY) { // bis zum SItzplatz der zweiten Keyfarbe die Farben aus der ersten und zweiten Keyfarbe interpolieren
      palette[i] = lerpColor(icy, temperate, (float)i/KEY);
    } else {// darüber aus der zweiten und dritten Keyfarbe heraus
      palette[i] = lerpColor(temperate, scorching, ((float)i-KEY)/KEY);
    }
    // der dritte Parameter für lerpColor() sollte von 0 bis 1 laufen,
    // damit auch die Keyfarben ordentlich abgebildet werden
  }
}

void draw() {
  background(0);
  noStroke();
  
  // TODO: mit Hilfe von days() einmal tglich die Daten neu vom API-Server holen
  
  /*
  // Die ganze Farbpalette einmal als Fcher zeichnen
  for (int i = 0; i < STEPS; i++) {
    fill(palette[i]);
    rect(i * (float)width/STEPS, 0, (float)width/STEPS, height);
  }
  */
  
  // Durch das gewrappte JSON-Objekt laufen und die gewünschten Werte
  // rausziehen. Wir brauchen den JSON-Object-Wrapper,
  // da Java/Processing sonst nichts mit dem Objektformat anfangen kann
  // (im Gegensatz zu Javascript, woher das JSON-Format kommt)
  float tempMin = data.getJSONObject("main").getFloat("temp_min");
  color tempMinColor = palette[(int)map(tempMin, 0, 30, 0, STEPS - 1)];
  float tempMax = data.getJSONObject("main").getFloat("temp_max");
  color tempMaxColor = palette[(int)map(tempMax, 0, 30, 0, STEPS - 1)];
  
  // 
  fill(tempMinColor);
  beginShape();
  vertex(0, 0);
  vertex(width, 0);
  vertex(0, height);
  endShape();
  
  fill(tempMaxColor);
  beginShape();
  vertex(0, height);
  vertex(width, 0);
  vertex(width, height);
  endShape();
  
  textFont(blackFont);
  textSize(120);
    
  fill(0);
  text((tempMin + "°").substring(0, tempMin >= 10 ? 4 : 3), 10+5, 130+5);
  text((tempMax + "°").substring(0, tempMax >= 10 ? 4 : 3), width - 350+5, height - 130+5);
  
  fill(255);
  text((tempMin + "°").substring(0, tempMin >= 10 ? 4 : 3), 10, 130);
  text((tempMax + "°").substring(0, tempMax >= 10 ? 4 : 3), width - 350, height - 130);
}
