Extension: ERGZusatzinformationZurAbrechnungsart
Id: ERGZusatzinformationZurAbrechnungsart
Title: "Zusatzinformation zur Abrechnungsart"
Description: "Die Abrechnung nach §13 kann ergänzend zu den grundsätzlichen Ausrichtungen der Abrechnung aufgeführt werden. Diese Extension erlaubt es, die Ausrichtung der Rechnung entsprechend zu flaggen.
Ist die Extension gesetzt, dann ist die Frage der Abrechnung nach §13 Abs. 2 SGB V mit 'Ja' beantwortet"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice.type"
* . ^short = "Zusatzinformation zur Abrechnungsart"
* value[x] only boolean
* valueBoolean = true