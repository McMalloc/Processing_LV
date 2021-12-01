#include <Arduino.h>


const int ledPin7 = 7;
const int ledPin8 = 8;

int ledState7 = LOW;             
int ledState8 = LOW;           

void setup() {
  pinMode(ledPin7, OUTPUT);
  pinMode(ledPin8, OUTPUT);
}

void loop() {
    digitalWrite(ledPin7, HIGH);
}