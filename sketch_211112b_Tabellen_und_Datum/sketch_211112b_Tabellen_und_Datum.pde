import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter; // Import the DateTimeFormatter class

Table temperatures;

/* Die Formatierer für Datums-Strings sind Objekte. Ihnen wird
   ein String gefüttert, dass das vorgegebene bzw gewünschte Format
   repräsentiert. Die Arbeit mit Datumsangaben ist aufgrund der 
   Komplexität in der echten Welt in jeder Programmiersprache
   kniffelig und Java ist da leider keine Ausnahme.
   Hier findet ihr eine Beschreibung der Formatierer und auch
   wie sich der Pattern-String zusammensetzt:
   https://docs.oracle.com/javase/8/docs/api/java/time/format/DateTimeFormatter.html 
*/
DateTimeFormatter inFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS Z");
DateTimeFormatter outFormat = DateTimeFormatter.ofPattern("dd.MM.yyyy");

void setup() {
  // von https://www.kaggle.com/muthuj7/weather-dataset
  // vermutlich Leeds, England, aber wenigstens vollständig
  temperatures = loadTable("data/weatherHistory.csv", "header");
  
  for (int row = 0; row < temperatures.getRowCount(); row++) {
    /* Die neue Tabelle hat Header, daher könnt ihr die Spalten direkt abfragen.
       LocalDateTime ist ein Objekt, dass eine Datum, eine Zeit und eine Zeitzone 
       repräsentiert.
    */
    LocalDateTime dateOfRow = LocalDateTime.parse(
      temperatures.getRow(row).getString("Formatted Date"), 
      inFormat
    );
    println(dateOfRow.format(outFormat));
  }
}

void draw() {

}
