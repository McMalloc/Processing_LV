#include <Arduino.h>

const int ledPin7 = 7;
const int ledPin8 = 8;

int ledState7 = LOW;
int ledState8 = LOW;

String inputString = "";      // a String to hold incoming data
bool stringComplete = false;  // whether the string is complete

void setup() {
    pinMode(ledPin7, OUTPUT);
    pinMode(ledPin8, OUTPUT);

    // initialize serial:
    Serial.begin(9600);
    // reserve 200 bytes for the inputString:
    inputString.reserve(200);
}

void loop() {
    Serial.println((int)'7');
    while (Serial.available()) {
      // get the new byte:
      char inputChar = (char)Serial.read();
      Serial.println(String(inputChar));
      int inputNumber = (int)inputChar;
      // add it to the inputString:

      if (inputNumber == 7) {
        ledState7 = !ledState7;
        digitalWrite(ledPin7, ledState7);
        Serial.println("Pin 7: " + ledState7);
      } else if (inputNumber == 8) {
        ledState8 = !ledState8;
        digitalWrite(ledPin8, !ledState8);
        Serial.println("Pin 8: " + ledState8);
      }

      inputString += inputChar;
      // if the incoming character is a newline, set a flag so the main loop
      // do something about it:
      if (inputChar == '\n') {
        stringComplete = true;
      }
    }

    if (stringComplete) {
        Serial.println(inputString);
        inputString = "";
        stringComplete = false;
    }
}

void serialEvent() {
    while (Serial.available()) {
        // get the new byte:
        char inChar = (char)Serial.read();
        // add it to the inputString:
        inputString += inChar;
        // if the incoming character is a newline, set a flag so the main loop
        // can do something about it:
        if (inChar == '\n') {
            stringComplete = true;
        }
    }
}