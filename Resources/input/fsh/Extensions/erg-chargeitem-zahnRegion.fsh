Extension: ERGZahnRegion
Id: erg-zahnregion
Title: "ERG Zahn/Region Extension"
Description: "In dieser Extension wird die Angabe der Zahn/Region an einer Rechnungsposition der eRechnung abgebildet."
Context: ChargeItem.bodysite
* value[x] only string
* valueString
  * ^short = ""
  * ^comment = "Das Element Zahn/Region ist ein Freitextfelt und SOLL vorhanden sein.
  Im GOZ-Rechnungsformular zugelassen ist 
  - zwei Ziffern durch Komma und Leerzeichen getrennt
  - Bereich zugelassen, z.B. 17-27
  Die Kieferbezeichnung mit 'OK' und 'UK' ist im Formular nicht zulässig, da die Verwendung allerdings die Regel ist, wird der Inhalt des Feldes nicht nach Korrektheit überprüft."