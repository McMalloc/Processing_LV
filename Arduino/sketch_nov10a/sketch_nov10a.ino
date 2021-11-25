#include <Gaussian.h>

Gaussian randomiser_a = Gaussian(30, 8);
Gaussian randomiser_b = Gaussian(80, 3);


String prefix_a, prefix_b;
void setup() {
  Serial.begin(9600);
  prefix_a = String("A:");
  prefix_b = String("B:");
}
 
void loop() {
  int value_a = round(randomiser_a.random());
  int value_b = round(randomiser_b.random());
  Serial.println(prefix_a + value_a);
  delay(20);
  Serial.println(prefix_b + value_b);
  delay(20);
}
