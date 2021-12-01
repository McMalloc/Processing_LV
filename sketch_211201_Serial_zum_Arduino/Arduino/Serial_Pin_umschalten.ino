/**
 * Dieser Sketch liest die serielle Verbindung aus und schaltet
 * bei Tastendruck auf 7 bzw. 8 den jeweiligen Pin an oder aus,
 * z.B. eine LED.
 * 
 */

const int ledPin7 = 7;
const int ledPin8 = 8;

// Beide Pins sind erstmal aus
int ledState7 = LOW;
int ledState8 = LOW;

void setup() {
    pinMode(ledPin7, OUTPUT);
    pinMode(ledPin8, OUTPUT);

    Serial.begin(9600);
}

void loop() {
    /**
     * Sobald ein Byte auf der Leitung liegt, das Processing
     * mit arduinoPort.write() geschrieben hat, springt der Code
     * in die while-Schleife.
     * 
     */
    while (Serial.available()) {
      /**
       * Die Verbindung kommuniziert in ASCII, d.h. der
       * gelesene Character ist z.B. '7'.
       * 
       */
      char inputChar = (char)Serial.read();

      /**
       * In Ganzzahl umwandeln. Character '7' z.B. entspricht 
       * dann wieder 55, wie der keyCode, den Processing
       * eingefangen hat.
       * Für 55 ('7') bzw. 56 ('8') dann den jeweiligen Pin 
       * mit dem Negationsoperator ! umschalten.
       * In der Hilfsvariable ledStateX merken wir uns,
       * ob der Pin bereits an oder aus ist. Dann meldet sich
       * der Arduino mit Serial.println an Processing zurück.
       * 
       */
      int inputCode = (int)inputChar;

      if (inputCode == 55) {
        
        ledState7 = !ledState7;
        digitalWrite(ledPin7, ledState7);
        Serial.println(ledState7 ? "7 an" : "7 aus");
      
      } else if (inputCode == 56) {
        
        ledState8 = !ledState8;
        digitalWrite(ledPin8, ledState8);
        Serial.println(ledState8 ? "8 an" : "8 aus");
      
      }
    }
}