import processing.serial.*;

Serial arduinoPort; 

void initSerial() {
  if (arduinoPort != null) {
    arduinoPort.stop();
  }
  print("Serielle Ports: "); printArray(Serial.list());
  arduinoPort = new Serial(this, Serial.list()[0], 9600);
}

void serialEvent(Serial arduino) {
  // Nachricht auslösen und Whitespaces (den Zeilenumbruch) abschneiden
  String message = trim(arduino.readString());
  println("Arduino hat angerufen und sagte: " + message);
}

void keyPressed() {
  if (keyCode == 32) {
    initSerial();
  }
  arduinoPort.write(keyCode);
}

void setup() {
  size(1600, 800);
  initSerial();
}

void draw() {
  background(0);
}
