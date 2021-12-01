import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class

Table temperatures;

DateTimeFormatter inFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS Z");
DateTimeFormatter outFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");

void setup() {
  temperatures = loadTable("data/weatherHistory.csv", "header");
  
  // testweise durch alle Reihen und Spalten iterieren und den Wert ausgeben
  for (int row = 0; row < temperatures.getRowCount(); row++) {
    LocalDateTime dateOfRow = LocalDateTime.parse(temperatures.getRow(row).getString("Formatted Date"), inFormat);
    println(dateOfRow.format(outFormat));
  }
}

void draw() {
  // Durchschnittstemperaturen der Jahre visualisieren
}
