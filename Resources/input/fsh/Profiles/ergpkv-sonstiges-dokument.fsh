Profile: ERGPKVSonstigesDokument
Title: "ERGPKV Sonstiges Dokument"
Parent: DocumentReference
Id: ergpkv-sonstiges-dokument
* status MS
* status = #current
  * ^comment = "Versionierung von sonstigen Dokument ist nicht unterstüzt. Nur jeweils die aktuelle Version des Dokumentes wird akzeptiert."
* type 1.. MS
* type.coding 1.. 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains KDL 0..1 MS
* type.coding[KDL] from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-sonstigesdokument-type-vs (extensible)
  * ^comment = "Top-Level Kodes der KDL sollten angboten werden um der Benutzer:in eine verständliche Auswahl zu präsentieren."
* subject MS
  * reference 1..1 MS
  * ^comment = "Der Fachdienst verknüpft alle Dokumente mit der Rechnungsempfänger:in oder der Patient:in"
* content MS
  * attachment MS
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Anhang seitens der Leistungserbringer:in und der Patient:in unterstüzt."
    * url 0.. MS
      * ^comment = "Der Fachdienst extrahiert das base64-kodierte PDF und verlinkt eine Binary-Repräsentation nach Entgegennahme der Rechnung."
    * data 0.. MS
      * ^comment = "Der Fachdienst extrahiert das base64-kodierte PDF und verlinkt eine Binary-Repräsentation nach Entgegennahme der Rechnung. Dieses Feld muss durch die Applikation der Leistungserbringer:in oder der Patient:in gefüllt werden."