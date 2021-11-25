Table temperatures;

void setup() {
  temperatures = loadTable("data/GermanyTemperatures.csv");
  
  // testweise durch alle Reihen und Spalten iterieren und den Wert ausgeben
  for (int row = 0; row < temperatures.getRowCount(); row++) {
    for (int column = 0; column < temperatures.getColumnCount(); column++) {
      println(temperatures.getRow(row).getString(column));
    }
  }
}

void draw() {
  // Durchschnittstemperaturen der Jahre visualisieren
}
