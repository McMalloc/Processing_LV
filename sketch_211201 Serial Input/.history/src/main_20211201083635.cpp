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
    digitalWrite(ledPin7, HIGH);
}