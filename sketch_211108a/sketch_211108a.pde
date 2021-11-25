JSONObject json;

final int STEPS = 80;
int[] palette = new int[STEPS];

PFont blackFont;
PFont regFont;

final int WIDTH = 1600;
final int HEIGHT = 800;

int minTemp;
int maxTemp;
int tempTommorrow;
int tempAfterTommorrow;

int colorMin;
int colorMax;
int colorTommorrow;
int colorAfterTommorrow;

String city = "Magdeburg";
PImage clearsky;

int currentDay;

void setup() {
  
  clearsky = loadImage("Clear_Sky.jpg");

  json = loadJSONObject("https://wttr.in/" + city + "?format=j1");
  frameRate(1);
  size(1600, 800, P2D);
  
  blackFont = createFont("Inter-Black.otf", 96);
  regFont = createFont("Inter-Regular.otf", 12);
  
  color icy = color(14, 14, 240);
  color temperate = color(250, 250, 15);
  int key = STEPS / 2;
  color scorching = color(255, 51, 15);

  for (int i = 0; i < STEPS; i++) {
    if (i < key) {
      palette[i] = lerpColor(icy, temperate, (float)i/key);
    } else {
      palette[i] = lerpColor(temperate, scorching, (float)(i-key)/key);
    }
  }
}

void draw() {
  
  if (currentDay != day()) {
    println("a new day!");
    currentDay = day();
    json = loadJSONObject("https://wttr.in/" + city + "?format=j1");
    
    minTemp = json
      .getJSONArray("weather")
      .getJSONObject(0)
      .getInt("mintempC");
    colorMin = (int)map(minTemp, -5, 30, 0, 39);  
    maxTemp = json
        .getJSONArray("weather")
        .getJSONObject(0)
        .getInt("maxtempC");
    colorMax = (int)map(maxTemp, -5, 30, 0, 39);
    
    tempTommorrow = json
        .getJSONArray("weather")
        .getJSONObject(1)
        .getInt("avgtempC");
    colorTommorrow = (int)map(tempTommorrow, -5, 30, 0, 39);
    
    tempAfterTommorrow = json
        .getJSONArray("weather")
        .getJSONObject(2)
        .getInt("avgtempC");
    colorAfterTommorrow = (int)map(tempAfterTommorrow, -5, 30, 0, 39);
  }
  
  noStroke();
  
  fill(palette[colorMin]);
  beginShape();
  vertex(0, 0);
  vertex(WIDTH * 0.5, 0);
  vertex(WIDTH * 0.75, HEIGHT/2);
  vertex(0, HEIGHT/2);
  endShape();  
  
  tint(palette[colorMax]);
  textureMode(NORMAL);
  beginShape();
  texture(clearsky);
  vertex(0, HEIGHT/2, 0, 0);
  vertex(WIDTH * 0.75, HEIGHT/2, 0.7, 0);
  vertex(WIDTH * 0.75, HEIGHT, 1, 0.5);
  vertex(0, HEIGHT, 0, 0.5);
  endShape();
  
  stroke(255);
  
  fill(palette[tempTommorrow]);
  beginShape();
  vertex(WIDTH * 0.5, 0);
  vertex(WIDTH * 0.75, 0);
  vertex(WIDTH, HEIGHT);
  vertex(WIDTH * 0.75, HEIGHT);
  endShape();
  
    
  fill(palette[tempAfterTommorrow]);
  beginShape();
  vertex(WIDTH * 0.75, 0);
  vertex(WIDTH, 0);
  vertex(WIDTH, HEIGHT);
  endShape();
  
  fill(255);
  textFont(regFont);
  text("heute min.", 20, 50);
  text("max.", 20, HEIGHT * 0.5 + 50);
  text("morgen", WIDTH * 0.6, 50);
  text("übermorgen", WIDTH * 0.85, 50);
  text(city, 20, HEIGHT - 50);
  textFont(blackFont);
  text(minTemp + "°", 20, 300);
  text(maxTemp + "°", 20, HEIGHT * 0.85);
  
  textSize(50);
  text(tempTommorrow + "°", WIDTH * 0.6, 200);
  text(tempAfterTommorrow + "°", WIDTH * 0.85, 200);
  
  /*
  // Palette testen
  for (int i = 0; i < STEPS; i++) {
    fill(palette[i]);
    rect(i * WIDTH/STEPS, 0, WIDTH/STEPS, HEIGHT);
  }
  */
}
