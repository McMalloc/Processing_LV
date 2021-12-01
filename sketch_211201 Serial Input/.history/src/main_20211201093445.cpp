#include <Arduino.h>

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
    while (Serial.available()) {
      // get the new byte:
      char inputChar = (char)Serial.read();
      Serial.println(String(inputChar));
      int inputCode = (int)inputChar;
      // add it to the inputString:

      if (inputCode == 55) {
        ledState7 = !ledState7;
        digitalWrite(ledPin7, ledState7);
        Serial.println("Pin 7: " + ledState7);
      } else if (inputCode == 56) {
        ledState8 = !ledState8;
        digitalWrite(ledPin8, ledState8);
        Serial.println(ledState8 ? "8 an" : "8 aus");
      }
    }
}