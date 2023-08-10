Instance: ERGPKVOperationPopulate
InstanceOf: OperationDefinition
Usage: #example
Title: "erechnung-populate"
Description: "Übermittelung der strukturierten Rechnungsinhalte, Rechnungsmetadaten und PDF-Repräsentation zur Speicherung und Validierung"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/Populate"
* status = #draft
* kind = #operation
* name = "ERechnung_Populate"
* code = #erechnung-populate
* resource = #Invoice
* system = false
* type = true
* instance = false
* affectsState = true
* comment = "Test Comment"
* parameter[+]
  * name = #rechnungstoken
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Rechnungstoken zur eindeutigen Identifizierung der Rechnung"
  * type = #Identifier
* parameter[+]
  * name = #rechnung
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Rechnung inkl. PDF-Repräsentation, strukturierten Rechnungspositionen und Signatur"
  * type = #Bundle
* parameter[+]
  * name = #rechnungsanhang
  * use = #in
  * min = 1
  * max = "*"
  * documentation = "Sonstige Dokumente inkl. PDF-Repräsentation"
  * type = #DocumentReference