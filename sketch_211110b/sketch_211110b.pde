final int STEPS = 80;
int[] palette = new int[STEPS];



final int WIDTH = 1600;
final int HEIGHT = 800;

Table table;

int currentDay;
int total;
int yearsDisplayed = 70;

void setup() {
  table = loadTable("GermanyTemperatures.csv");
  
  total = table.getRowCount();

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

  size(1600, 800, P2D);
  frameRate(4);
}

void draw() {
  background(0);
  float temp;
  int avgTemp;
  for (int i = 0; i < yearsDisplayed; i++) {
    avgTemp = 0;
    for (int month = 1; month <= 12; month++) {
      avgTemp += table.getFloat(total - 1 - ((yearsDisplayed-i)*12) - month, 1);
    }
    temp = avgTemp/12;
    println("  - - -  -");
    fill(palette[(int)map(temp, 0, 15, 0, 39)]);
    rect((float)WIDTH/yearsDisplayed * i, 0, (float)WIDTH/yearsDisplayed, HEIGHT);
    
    fill(255);
    text(temp + "°", (float)WIDTH/yearsDisplayed * i, 20*i % HEIGHT - 10);
  }
  
  for (int i = 0; i < yearsDisplayed; i++) {
    fill(255);
    text(table.getString(total - 1 - ((yearsDisplayed-i)*12), 0).substring(0, 4), (float)WIDTH/yearsDisplayed * i, 20*i % HEIGHT);
  }
}
