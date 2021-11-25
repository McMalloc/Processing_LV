import processing.serial.*;

Serial myPort;
String portStream;
 
void setup() {
  // Ausgabefenster und Vorder-/Hintergrundfarben definieren
  size(380,200);
  
  String portName = Serial.list()[0];
  
  myPort = new Serial(this, portName, 9600);
  
  // Ankommende Zeichen am Port werden solange gebuffert, bis das angebene Zeichen empfangen wird.
  // Damit ist ein Datenblock vollständig übertragen. \n ist das 2. Zeichen eines Zeilenwechsels (\r\n)
  myPort.bufferUntil('\n');
}
 
// Wie loop() beim Arduino wird draw() immer wieder aufgerufen, solange das Programm ausgeführt wird.
void draw() {
  background(0);
  fill(255);
  textSize(50);
  // Steht was in portStream? (d.h. wurde ein vollständiger Datenblock übertragen)
  if(portStream != null) {
      text(portStream, 20, 55);
  }
 
}
 
// serialEvent wird aufgerufen, wenn das weiter oben über bufferUntil definierte Zeichen empfangen wird.
// Dann wird der Inhalt des seriellen Buffers in portStream geschrieben.
void serialEvent(Serial myPort) {
  portStream = myPort.readString();
}
