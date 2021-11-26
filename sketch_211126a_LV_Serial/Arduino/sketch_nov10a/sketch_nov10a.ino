#include <Gaussian.h>

Gaussian randomiser_a = Gaussian(100, 30);

void setup() {
  Serial.begin(9600);
}
 
void loop() {
  int value_a = round(randomiser_a.random());
  Serial.println(value_a);
  delay(20);
}
