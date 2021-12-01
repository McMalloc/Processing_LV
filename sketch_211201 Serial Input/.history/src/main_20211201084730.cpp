#include <Arduino.h>


const int ledPin7 = 7;
const int ledPin8 = 8;

int ledState7 = LOW;             
int ledState8 = LOW;   

String inputString = "";         // a String to hold incoming data
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
    Serial.println("Hallo");

    // while (Serial.available()) {
    //   // get the new byte:
    //   char inChar = (char)Serial.read();
    //   // add it to the inputString:
    //   inputString += inChar;
    //   // if the incoming character is a newline, set a flag so the main loop can
    //   // do something about it:
    //   if (inChar == '\n') {
    //     stringComplete = true;
    //   }
    // }

    digitalWrite(ledPin7, HIGH);
      // print the string when a newline arrives:
    if (stringComplete) {
      Serial.println(inputString);
      // clear the string:
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
    // if the incoming character is a newline, set a flag so the main loop can
    // do something about it:
    if (inChar == '\n') {
      stringComplete = true;
    }
  }
}