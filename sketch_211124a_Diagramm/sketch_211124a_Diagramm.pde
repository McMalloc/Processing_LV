import processing.serial.*;

Serial myPort;
String portStream;

ArrayList<Integer> valuesA = new ArrayList<Integer>();
ArrayList<Integer> valuesB = new ArrayList<Integer>();

color black = color(0);
color white = color(255);

color blue = color(36, 114, 240);
color yellow = color(204, 255, 0);

// serialEvent wird aufgerufen, wenn das weiter oben über bufferUntil definierte Zeichen empfangen wird.
// Dann wird der Inhalt des seriellen Buffers in portStream geschrieben.
void serialEvent(Serial myPort) {
  String message = trim(myPort.readString());
  String prefix = message.substring(0,1);
  String value = message.substring(2);

  if (message.charAt(0) == 'A') {
  //if (prefix.equals("A")) {
    valuesA.add(0, parseInt(value));
  } else if (message.charAt(0) == 'B') {
    valuesB.add(0, parseInt(value));
  }
  
  /*values.add(0, parseInt(message));
  if (values.size() > 200) {
    values.remove(values.size() - 1);
  } */
}

void initSerial() {
  String portName = Serial.list()[0];
  println(portName);
  if (myPort != null) {
    myPort.stop();
  }
  myPort = new Serial(this, portName, 9600);
  
  // Ankommende Zeichen am Port werden solange gebuffert, bis das angebene Zeichen empfangen wird.
  // Damit ist ein Datenblock vollständig übertragen. \n ist das 2. Zeichen eines Zeilenwechsels (\r\n)
  myPort.bufferUntil('\n');
}

void keyPressed() {
    if (keyCode == 32) {
      initSerial();
    }
}

void setup() {
  size(1600, 800, P2D);
  noSmooth();
  
  initSerial();
}

void drawValues(ArrayList values) {
  beginShape();
  //vertex(0, height/2);
  vertex(0, height);
  for (int i = 0; i < values.size(); i++) {
    vertex((float)i / values.size() * width, height - ((int)values.get(i) / 100.0) * height);
  }
  vertex(width, height);
  endShape();
}

void draw() {
  background(black);
  
  stroke(white);
  
  fill(180);

  strokeWeight(1);
  drawValues(valuesA);
  

  
  strokeWeight(3);
  noFill();
  drawValues(valuesB);
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    if (pixels[i] > black) {
      pixels[i] = lerpColor(blue, yellow, (i / (float)width) / height);
    };
  }
  updatePixels();
  
  textSize(18);
  for (int i = 0; i <= 10; i++) {
    text(i * 10, 10, 20 + height*i/10);
  }
}
